Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC5118569E
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 01:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584231282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jgccy5Ri6u9asVj/y08X4E/xMJwuF5cOyTZoRx7HclQ=;
	b=JqcFu+H9vWbG6vZktQjFQm09AjmvWLDLYVZp+5RoAM+3dSnnZ9ShH/Bm7arKUq+7p4mpDi
	neIUvoQnlCCfP5CgmDlqJXxY992kTdQd441yR0sjoZG3VNvm568SjdvqLJU8fArMXPbgth
	uimYtN2giSVOSZsfOwAjNb7hgOC1OYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-JCGLGRtXNKGk4o-nwWzeDw-1; Sat, 14 Mar 2020 20:14:40 -0400
X-MC-Unique: JCGLGRtXNKGk4o-nwWzeDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F56100550D;
	Sun, 15 Mar 2020 00:14:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20F9A60BEE;
	Sun, 15 Mar 2020 00:14:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4116718089CD;
	Sun, 15 Mar 2020 00:14:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02F0EDrR016893 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 14 Mar 2020 20:14:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 236F82166B2D; Sun, 15 Mar 2020 00:14:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F3CC2166B2C
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 00:14:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D22A80030F
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 00:14:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-15-XesI3tNqNr2JGRsLxWZ6IQ-1;
	Sat, 14 Mar 2020 20:14:08 -0400
X-MC-Unique: XesI3tNqNr2JGRsLxWZ6IQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 68420AC23;
	Sun, 15 Mar 2020 00:14:06 +0000 (UTC)
Message-ID: <dc0b5e29735f0a7f85f1360f9a0feedd35f3e077.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sun, 15 Mar 2020 01:14:12 +0100
In-Reply-To: <20200314231539.GS30153@octiron.msp.redhat.com>
References: <20200306230605.3473-1-mwilck@suse.com>
	<20200306230605.3473-3-mwilck@suse.com>
	<20200314231539.GS30153@octiron.msp.redhat.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02F0EDrR016893
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Bond <dbond@suse.com>
Subject: Re: [dm-devel] [PATCH 2/4] libmpathpersist: format_transportids():
 avoid PROUT overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-14 at 18:15 -0500, Benjamin Marzinski wrote:
> On Sat, Mar 07, 2020 at 12:06:03AM +0100, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > This limits the PERSISTENT RESERVE OUT data size to max. 8192
> > bytes.
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmpathpersist/mpath_pr_ioctl.c | 26 ++++++++++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/libmpathpersist/mpath_pr_ioctl.c
> > b/libmpathpersist/mpath_pr_ioctl.c
> > index 1a28cba7..8bf16c0d 100644
> > --- a/libmpathpersist/mpath_pr_ioctl.c
> > +++ b/libmpathpersist/mpath_pr_ioctl.c
> > @@ -1,5 +1,6 @@
> >  #include <stdio.h>
> >  #include <stdlib.h>
> > +#include <stddef.h>
> >  
> >  #include <sys/types.h>
> >  #include <sys/stat.h>
> > @@ -138,38 +139,59 @@ retry :
> >  	return status;
> >  }
> >  
> > +#define check_overflow(ofs, n, start, label)			
> > 	\
> > +	do {								
> > \
> > +		if ((ofs) + 4 + (n) +					
> > \
> 
> I don't get where the 4 comes from here, since buff_offset starts
> at 4. Maybe I'm just missing something.
> 

No. It's wrong, buff_offset includes these 4 bytes inded. Thanks for
spotting it. I'll resubmit the series.

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

