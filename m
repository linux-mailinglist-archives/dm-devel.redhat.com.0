Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 529852FEDE6
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jan 2021 16:03:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-N9BJOMmEOQqS5CfRifIYwg-1; Thu, 21 Jan 2021 10:03:39 -0500
X-MC-Unique: N9BJOMmEOQqS5CfRifIYwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE6F190B2A3;
	Thu, 21 Jan 2021 15:03:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 084E960C43;
	Thu, 21 Jan 2021 15:03:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D45C4BB7B;
	Thu, 21 Jan 2021 15:03:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LF2xa9019724 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 10:02:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D8F62166B2A; Thu, 21 Jan 2021 15:02:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88EA62166B2F
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 15:02:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ABDC1875040
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 15:02:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-24-M3q_Q0-FMM-qmqVAC8nZVg-1;
	Thu, 21 Jan 2021 10:02:54 -0500
X-MC-Unique: M3q_Q0-FMM-qmqVAC8nZVg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AEE83ABD6;
	Thu, 21 Jan 2021 15:02:52 +0000 (UTC)
Message-ID: <e8d2e33fd4cb6ecb8c727b3c3c4c5e4c9e260c33.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Mike Snitzer <snitzer@redhat.com>, Hannes Reinecke <hare@suse.de>
Date: Thu, 21 Jan 2021 16:02:52 +0100
In-Reply-To: <29294c6553c7ec3d31e1bc3b9de524e9c7060f07.camel@suse.com>
References: <20201210092459.81939-1-hare@suse.de>
	<29294c6553c7ec3d31e1bc3b9de524e9c7060f07.camel@suse.com>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm: avoid filesystem lookup in dm_get_dev_t()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 18:11 +0100, Martin Wilck wrote:
> On Thu, 2020-12-10 at 10:24 +0100, Hannes Reinecke wrote:
> > dm_get_dev_t() is just used to convert an arbitrary 'path' string
> > into a dev_t. It doesn't presume that the device is present; that
> > check will be done later, as the only caller is dm_get_device(),
> > which does a dm_get_table_device() later on, which will properly
> > open the device.
> > So if the path string already _is_ in major:minor representation
> > we can convert it directly, avoiding a recursion into the
> > filesystem
> > to lookup the block device.
> > This avoids a hang in multipath_message() when the filesystem is
> > inaccessible.
> > 
> > Signed-off-by: Hannes Reinecke <hare@suse.de>
> 
> Ack, although I believe the scsi/__GENKSYMS__ part doesn't belong
> here.
> 
> Note that this is essentially a revert/fix of 644bda6f3460 ("dm
> table:
> fall back to getting device using name_to_dev_t()"). Added the author
> of that patch to CC.

Mike, do you need anything more to apply this one? Do you want a
cleaned-up resend?

Cheers,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

