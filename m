Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 939062FEFE4
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jan 2021 17:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611245605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H0X3Pv2MRAH0e3RTooYacelAXzQeBSY58fYQaTknQN0=;
	b=LVTOxR4jWdpLMKJpnkWjMT/N8JpYt5MdSAgWEmhGZWHKCpPRg8VtjkO8OgHW9+K1zJMOSP
	IwQwfO1bVQt2pf1dN1gPczKJ5SNV8w6y04gk1E4bAiGske9qDIzS+Pj9SP4bdZBonv8LeQ
	sn/whXQX3/WsR25xtrc9WHY/Tivn/b8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-zeet6g6VNoGGAMEqUUWqjA-1; Thu, 21 Jan 2021 11:13:20 -0500
X-MC-Unique: zeet6g6VNoGGAMEqUUWqjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65DBAB810F;
	Thu, 21 Jan 2021 16:13:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0FD4E715;
	Thu, 21 Jan 2021 16:13:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB6FD180954D;
	Thu, 21 Jan 2021 16:12:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LG9bOO027875 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 11:09:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D36F510016F5; Thu, 21 Jan 2021 16:09:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B71A100AE42;
	Thu, 21 Jan 2021 16:09:34 +0000 (UTC)
Date: Thu, 21 Jan 2021 11:09:33 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210121160933.GA4104@redhat.com>
References: <20201210092459.81939-1-hare@suse.de>
	<29294c6553c7ec3d31e1bc3b9de524e9c7060f07.camel@suse.com>
	<e8d2e33fd4cb6ecb8c727b3c3c4c5e4c9e260c33.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <e8d2e33fd4cb6ecb8c727b3c3c4c5e4c9e260c33.camel@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, hch@lst.de
Subject: Re: [dm-devel] dm: avoid filesystem lookup in dm_get_dev_t()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 21 2021 at 10:02am -0500,
Martin Wilck <mwilck@suse.com> wrote:

> On Thu, 2020-12-10 at 18:11 +0100, Martin Wilck wrote:
> > On Thu, 2020-12-10 at 10:24 +0100, Hannes Reinecke wrote:
> > > dm_get_dev_t() is just used to convert an arbitrary 'path' string
> > > into a dev_t. It doesn't presume that the device is present; that
> > > check will be done later, as the only caller is dm_get_device(),
> > > which does a dm_get_table_device() later on, which will properly
> > > open the device.
> > > So if the path string already _is_ in major:minor representation
> > > we can convert it directly, avoiding a recursion into the
> > > filesystem
> > > to lookup the block device.
> > > This avoids a hang in multipath_message() when the filesystem is
> > > inaccessible.
> > > 
> > > Signed-off-by: Hannes Reinecke <hare@suse.de>
> > 
> > Ack, although I believe the scsi/__GENKSYMS__ part doesn't belong
> > here.
> > 
> > Note that this is essentially a revert/fix of 644bda6f3460 ("dm
> > table:
> > fall back to getting device using name_to_dev_t()"). Added the author
> > of that patch to CC.
> 
> Mike, do you need anything more to apply this one? Do you want a
> cleaned-up resend?

It got hung up with Christoph correctly requesting more discussion, last
linux-block/lkml mail on the associated thread I kicked off is here:
https://lkml.org/lkml/2020/12/23/76

Basically if Hannes or yourself would like to review that thread and
send a relevant v2 it'd really help move this forward.  I'm bogged down
with too many competing tasks.  You guys may be able to act on this line
of development/fixing quicker than I'll get to it.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

