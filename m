Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB741D1BFA
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 19:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589389927;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Lf1s1Eea/AnyPTzro7bE8uaxnyvMc7yo+ev6Kj9oIek=;
	b=VMQFgyScg0215f94JrGsSM6zTSiRgYhe+LVYyKifw6tcXsePYHoPdq1gDfBCx5LzljHeXl
	UQMNMRwJtmr3wYohH7pdtsYuTL8mM5NnB9V+5l01E6hHHpwJ7QD0pMAp+PRIIKjd/kqTEA
	nL5z00PYIiX8TYHxG31AMlECuWsnsj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-LGYmlG29MWuWrHLt1n9OhA-1; Wed, 13 May 2020 13:12:04 -0400
X-MC-Unique: LGYmlG29MWuWrHLt1n9OhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0851A0BD7;
	Wed, 13 May 2020 17:11:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF8701002382;
	Wed, 13 May 2020 17:11:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 819B51809543;
	Wed, 13 May 2020 17:11:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DHAleo011178 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 13:10:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4120961F50; Wed, 13 May 2020 17:10:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E8661541;
	Wed, 13 May 2020 17:10:44 +0000 (UTC)
Date: Wed, 13 May 2020 13:10:43 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200513171042.GA20324@redhat.com>
References: <20200513070843.71528-1-hare@suse.de>
	<BY5PR04MB6900AD28F5B6B6C3A8AEAA5EE7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<5357d0d6-12cb-9585-36ae-9aec206eebb4@suse.de>
	<20200513162502.GA20131@redhat.com>
	<ce79fe87-3d2c-794b-75d6-7e59fd0b447c@suse.de>
MIME-Version: 1.0
In-Reply-To: <ce79fe87-3d2c-794b-75d6-7e59fd0b447c@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] device-mapper: use dynamic debug instead of
 compile-time config option
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

On Wed, May 13 2020 at  1:01pm -0400,
Hannes Reinecke <hare@suse.de> wrote:

> On 5/13/20 6:25 PM, Mike Snitzer wrote:
> >On Wed, May 13 2020 at  7:10am -0400,
> >Hannes Reinecke <hare@suse.de> wrote:
> >
> >>On 5/13/20 11:41 AM, Damien Le Moal wrote:
> >>>On 2020/05/13 16:10, Hannes Reinecke wrote:
> >>>>Switch to use dynamic debug to avoid having recompile the kernel
> >>>>just to enable debugging messages.
> >>>>
> >>>>Signed-off-by: Hannes Reinecke <hare@suse.de>
> >>>>---
> >>>>  include/linux/device-mapper.h | 7 +------
> >>>>  1 file changed, 1 insertion(+), 6 deletions(-)
> >>>>
> >>>>diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
> >>>>index e2d506dd805e..3d4365fd3001 100644
> >>>>--- a/include/linux/device-mapper.h
> >>>>+++ b/include/linux/device-mapper.h
> >>>>@@ -556,13 +556,8 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
> >>>>  #define DMINFO(fmt, ...) pr_info(DM_FMT(fmt), ##__VA_ARGS__)
> >>>>  #define DMINFO_LIMIT(fmt, ...) pr_info_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
> >>>>-#ifdef CONFIG_DM_DEBUG
> >>>
> >>>Can we remove this from Kconfig as a config option ?
> >>>
> >>No, we can't, it's being used by dm-snap and dm-integrity.
> >
> >Yeah, they provide additional debugging if its set.
> >
> >But shouldn't we preserve old-style DMDEBUG if CONFIG_DM_DEBUG is set
> >(compile time printing of debugging) but if not set, use dynamic
> >debugging?
> >
> >Think I'd prefer that as the incremental improvement... thoughts?
> >
> Works for me; I just don't want to recompile the kernel anytime I
> need to debug device-mapper stuff.
> 
> Will be resending.

Does the use of pr_debug() cause missing newlines (with your patch)?

Only thought to ask this because I'm chasing another DM issue at the
moment and happened to see __dm_suspend()'s use of pr_debug() includes
an explicit extra \n.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

