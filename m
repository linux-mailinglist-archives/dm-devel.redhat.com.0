Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ACFA41D3675
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 18:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589473661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qTcR23zrYwt6zUTnaHV9cngRSWIXebg1ikzkfImtNM0=;
	b=hs98ZBXCYnzHgDDOB4dkAw1irUyKME504T8ESp5Cfgicdcs6cgg8DBwr5Vh2944nGw643b
	lDxEAiHDkSBJt4Jl31c1pryycFaGeuNo3wg4cL8nL0dHCx1llHAAVlmLNsWi2Y29TsUDvT
	j6Euz+Rhvv+nl0SlCXpT7CxsSm67C74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-9sr4FHjKMGSXPbuWjKxBrQ-1; Thu, 14 May 2020 12:27:36 -0400
X-MC-Unique: 9sr4FHjKMGSXPbuWjKxBrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67630835B49;
	Thu, 14 May 2020 16:27:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE3B510013BD;
	Thu, 14 May 2020 16:27:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 786714E98B;
	Thu, 14 May 2020 16:27:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EGQr2W018140 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 12:26:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 549221002395; Thu, 14 May 2020 16:26:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5AF10013BD;
	Thu, 14 May 2020 16:26:50 +0000 (UTC)
Date: Thu, 14 May 2020 12:26:49 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200514162649.GB31400@redhat.com>
References: <20200514060929.85469-1-hare@suse.de>
	<20200514060929.85469-2-hare@suse.de>
	<BY5PR04MB6900948BCF84B9B97C5E5921E7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900948BCF84B9B97C5E5921E7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] device-mapper: use dynamic debug instead
 of compile-time config option
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 14 2020 at  3:53am -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> On 2020/05/14 15:09, Hannes Reinecke wrote:
> > Switch to use dynamic debug to avoid having recompile the kernel
> > just to enable debugging messages.
> > 
> > Signed-off-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  include/linux/device-mapper.h | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
> > index af48d9da3916..4694e1bb4196 100644
> > --- a/include/linux/device-mapper.h
> > +++ b/include/linux/device-mapper.h
> > @@ -557,12 +557,11 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
> >  #define DMINFO(fmt, ...) pr_info(DM_FMT(fmt), ##__VA_ARGS__)
> >  #define DMINFO_LIMIT(fmt, ...) pr_info_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
> >  
> > +#define DMDEBUG_LIMIT(fmt, ...) pr_debug_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
> 
> Why do you move this one out of the #ifdef CONFIG_DM_DEBUG scope ?

I'd imagine because it already uses dynamic debugging and is useful even
if CONFIG_DM_DEBUG isn't set.  Makes sense to me.  I'll add a note about
it in the commit header though.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

