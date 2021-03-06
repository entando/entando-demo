<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/aps-core" prefix="wp" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<wp:headInfo type="CSS" info="../../plugins/jpfastcontentedit/static/css/editor.css" />
<wp:headInfo type="JS" info="../../plugins/jpfastcontentedit/static/js/moo-japs/moo-jAPS-0.2.js" />
<s:set name="js_for_tab">

//per cateogorie
window.addEvent('domready', function(){
	var catTree  = new Wood({
		menuToggler: "subTreeToggler",
		rootId: "categoryTree",
		openClass: "node_open",
		closedClass: "node_closed",
		showTools: "true",
		expandAllLabel: "<s:text name="label.expandAll" />",
		collapseAllLabel: "<s:text name="label.collapseAll" />",
		type: "tree",
		<s:if test="%{selectedNode != null && !(selectedNode.equalsIgnoreCase(''))}">
		startIndex: "fagianonode_<s:property value="selectedNode" />",
		</s:if>
		toolTextIntro: "<s:text name="label.introExpandAll" />",
		toolexpandAllLabelTitle: "<s:text name="label.expandAllTitle" />",
		toolcollapseLabelTitle: "<s:text name="label.collapseAllTitle" />"
	});

});

</s:set>
<wp:headInfo type="JS_RAW" info="${js_for_tab}" />

<div class="jpfastcontentedit-editor">
		<h2>
			<wp:i18n key="jpfastcontentedit_FASTCONTENTEDIT_SHOWLET_TITLE" />
		</h2>
		
		<h3><wp:i18n key="jpfastcontentedit_CHOOSE_ATTACH" /></h3>
		
	<form action="<wp:action path="/ExtStr2/do/jpfastcontentedit/Content/Resource/search.action" />" method="post">
		
		<fieldset>
			<p class="noscreen"><wpsf:hidden name="resourceTypeCode" /></p>
			<p>
				<label for="text"><wp:i18n key="jpfastcontentedit_DESCRIPTION" />:</label><br />
				<wpsf:textfield useTabindexAutoIncrement="true" name="text" id="text" cssClass="text" />
			</p>
			
			<p>
				<wp:i18n key="jpfastcontentedit_CATEGORY" />:<br />
			</p>
			
			<ul id="categoryTree">
				<s:set name="inputFieldName" value="'categoryCode'" />
				<s:set name="selectedTreeNode" value="selectedNode" />
				<s:set name="liClassName" value="'category'" />
				<s:set name="currentRoot" value="categoryRoot" />
				<s:include value="/WEB-INF/apsadmin/jsp/common/treeBuilder.jsp" />
			</ul>
			
			<s:set name="search_label"><wp:i18n key="jpfastcontentedit_SEARCH" /></s:set>
			<p><wpsf:submit useTabindexAutoIncrement="true" value="%{#search_label}" cssClass="button" /></p>
		</fieldset>
		
		
		<wpsa:subset source="resources" count="10" objectName="groupResource" advanced="true" offset="5">
		<s:set name="group" value="#groupResource" />
		
		<div class="pager">
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pagerInfo.jsp" />
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
		</div>
		
		<s:iterator var="resourceid">
		<s:set name="resource" value="%{loadResource(#resourceid)}"></s:set>
		<s:set name="resourceInstance" value="%{#resource.getInstance()}"></s:set>
		
		<dl class="gallery attach">
		<dt class="image"><a href="<wp:action path="/ExtStr2/do/jpfastcontentedit/Content/Resource/joinResource.action" ><wp:parameter name="resourceId"><s:property value="%{#resourceid}"/></wp:parameter></wp:action>#<s:property value="currentAttributeLang" />_tab" title="<wp:i18n key="jpfastcontentedit_JOIN_TO" />: <s:property value="content.descr" />" ><img src="<wp:resourceURL/>administration/common/img/icons/resourceTypes/<s:property value="%{getIconFile(#resourceInstance.fileName)}"/>" alt="<s:property value="%{#resourceInstance.fileName}"/>" title="<s:property value="%{#resourceInstance.fileName}"/>" /></a><br /><s:property value="%{#resourceInstance.fileLenght}"/></dt>
		<dt class="options">
			<a href="<wp:action path="/ExtStr2/do/jpfastcontentedit/Content/Resource/joinResource.action" ><wp:parameter name="resourceId"><s:property value="%{#resourceid}"/></wp:parameter></wp:action>#<s:property value="currentAttributeLang" />_tab" title="<wp:i18n key="jpfastcontentedit_JOIN_TO" />: <s:property value="content.descr" />" ><s:property value="#resource.descr" /></a>
		</dt>
		<%-- 
		<dd>
			<p>
				<a href="<wp:action path="/ExtStr2/do/jpfastcontentedit/Content/Resource/joinResource.action" ><wp:parameter name="resourceId"><s:property value="%{#resourceid}"/></wp:parameter></wp:action>#<s:property value="currentAttributeLang" />_tab" title="<wp:i18n key="jpfastcontentedit_JOIN_TO" />: <s:property value="content.descr" />" ><s:property value="#resource.descr" /></a>
			</p>
			<p>
				<a href="<s:property value="%{#resource.documentPath}" />" >view original</a>
			</p>
		</dd>
		--%>
		</dl>
		
		</s:iterator>
		
		<div class="pager clear">
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
		</div>
		
		</wpsa:subset>
		
	</form>
		
	<h3><wp:i18n key="jpfastcontentedit_LABEL_NEW_ATTACH" /></h3>
	<p>
		<a href="<wp:action path="/ExtStr2/do/jpfastcontentedit/Content/Resource/new.action"><wp:parameter name="resourceTypeCode">Attach</wp:parameter></wp:action>">
			Upload a new Attachment in the archive
		</a>
	</p>
</div>