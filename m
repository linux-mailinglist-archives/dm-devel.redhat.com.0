Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E706D23CC52
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 18:38:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-shc7JJIPMfiT3s4mTocvuQ-1; Wed, 05 Aug 2020 12:38:18 -0400
X-MC-Unique: shc7JJIPMfiT3s4mTocvuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 529CA1932484;
	Wed,  5 Aug 2020 16:38:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A575A5D9DC;
	Wed,  5 Aug 2020 16:38:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA18396916;
	Wed,  5 Aug 2020 16:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075GbibJ016973 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 12:37:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F0051112843; Wed,  5 Aug 2020 16:37:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 596A21112840
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 16:37:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 302B889CD14
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 16:37:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-24-_Fcy9tlfMFmawSOi8l8VOA-1;
	Wed, 05 Aug 2020 12:37:38 -0400
X-MC-Unique: _Fcy9tlfMFmawSOi8l8VOA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3A877ABD2;
	Wed,  5 Aug 2020 16:37:53 +0000 (UTC)
Message-ID: <95eabfa37f3da63b27f9a68a693a9e44bba9b0d8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 18:37:35 +0200
In-Reply-To: <20200719050716.GW11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-12-mwilck@suse.com>
	<20200719050716.GW11089@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 64/74] multipathd: check_path(): set
 retrigger_delay if necessary
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-19 at 00:07 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:51:35PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > In a follow up patch, we will set INIT_MISSING_UDEV and set tick=1
> > (minimal) at the same time. In this case, which is new,
> > check_path()
> > must reset the delay when it first triggers an uevent.
> 
> Maybe I'm just being obtuse here, but I don't get what this does.
> pp->tick will always be 0 for any path that makes it to the check
> 
> if (!pp->mpp && pp->initialized == INIT_MISSING_UDEV) {
> 
> And then if it's not out of retries, the path will get set to
> INIT_REQUESTED_UDEV, and pathinfo() will take care of resetting pp-
> >tick
> when it gets called by the new uevent.
> 
> If it is out of retries, the path won't get pp->tick reset, which
> seems
> wrong, but it that case it should probably be set to max_checkint,
> like
> happens when the "add missing paths" code fails.
> 
> Or like I said, maybe I'm just missing something.

You're not. This was just plain stupid.

Thanks
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

