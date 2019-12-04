Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A0EB3113028
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 17:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575477717;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zSIEcSOwXifrxYKtxV/knIbFOSsPItWf0FUtRjnNYos=;
	b=cmEFUApz9Kkvc4Yv1iulN3hkVl21CdCRbLOKPxZ3nMA1vVjDscbCl4kYfGwIFOs8qZ8lDD
	Odk1SIIcdvw9GI9bHinUJa6RwkbyuUCW6WC2iLC6HRKRLny+GCykhEkl9wX1zm6C1s2lU+
	LR/QKPEkKxdWWRgwD5YrRnHX1HJvAgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-M6tnF0O_OSqSpOecQSli-g-1; Wed, 04 Dec 2019 11:41:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE8AE1005513;
	Wed,  4 Dec 2019 16:41:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D5F19C69;
	Wed,  4 Dec 2019 16:41:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC4295BC11;
	Wed,  4 Dec 2019 16:41:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4GdhK7016248 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 11:39:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F8DF5C1B5; Wed,  4 Dec 2019 16:39:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 968ED5C1B2;
	Wed,  4 Dec 2019 16:39:40 +0000 (UTC)
Date: Wed, 4 Dec 2019 11:39:39 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191204163939.GA30305@redhat.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<20191204140742.26273-3-ntsironis@arrikto.com>
	<20191204152759.qhh2f6ybhww7ivel@reti>
	<4627d4b3-fced-0d22-34c5-258733c9afa9@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <4627d4b3-fced-0d22-34c5-258733c9afa9@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] dm thin: Flush data device before
	committing metadata
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
X-MC-Unique: M6tnF0O_OSqSpOecQSli-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 04 2019 at 11:17am -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 12/4/19 5:27 PM, Joe Thornber wrote:
> >On Wed, Dec 04, 2019 at 04:07:42PM +0200, Nikos Tsironis wrote:
> >>The thin provisioning target maintains per thin device mappings that map
> >>virtual blocks to data blocks in the data device.
> >
> >
> >Ack.  But I think we're issuing the FLUSH twice with your patch.  Since the
> >original bio is still remapped and issued at the end of process_deferred_bios?
> >
> 
> Yes, that's correct. I thought of it and of putting a check in
> process_deferred_bios() to complete FLUSH bios immediately, but I have
> one concern and I preferred to be safe than sorry.
> 
> In __commit_transaction() there is the following check:
> 
>   if (unlikely(!pmd->in_service))
>             return 0;
> 
> , which means we don't commit the metadata, and thus we don't flush the
> data device, in case the pool is not in service.
> 
> Opening a thin device doesn't seem to put the pool in service, since
> dm_pool_open_thin_device() uses pmd_write_lock_in_core().
> 
> Can I assume that the pool is in service if I/O can be mapped to a thin
> device? If so, it's safe to put such a check in process_deferred_bios().

In service means upper layer has issued a write to a thin device of a
pool.  The header for commit 873f258becca87 gets into more detail.

> On second thought though, in order for a flush bio to end up in
> deferred_flush_bios in the first place, someone must have changed the
> metadata and thus put the pool in service. Otherwise, it would have been
> submitted directly to the data device. So, it's probably safe to check
> for flush bios after commit() in process_deferred_bios() and complete
> them immediately.

Yes, I think so, which was Joe's original point.
 
> If you confirm too that this is safe, I will send a second version of
> the patch adding the check.

Not seeing why we need another in_service check.  After your changes are
applied, any commit will trigger a preceeding flush.. so the deferred
flushes are redundant.

By definition, these deferred bios imply the pool is in service.

I'd be fine with seeing a 3rd follow-on thinp patch that completes the
redundant flushes immediately.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

