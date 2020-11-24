Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC53C2C3244
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 22:00:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-6x08Sd41PLmcpFI9c58AOw-1; Tue, 24 Nov 2020 16:00:31 -0500
X-MC-Unique: 6x08Sd41PLmcpFI9c58AOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B15021007464;
	Tue, 24 Nov 2020 21:00:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 805E91F0;
	Tue, 24 Nov 2020 21:00:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A6AE4A7C6;
	Tue, 24 Nov 2020 21:00:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOL0217019723 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 16:00:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3BDA69464E; Tue, 24 Nov 2020 21:00:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 361E69463D
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 20:59:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AECB38007DF
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 20:59:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-560-Misk3otIPhKnWE_ZRMPNZA-1;
	Tue, 24 Nov 2020 15:59:55 -0500
X-MC-Unique: Misk3otIPhKnWE_ZRMPNZA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 549A0ADA2;
	Tue, 24 Nov 2020 20:59:53 +0000 (UTC)
Message-ID: <7544ce5c23815638ecc431e934e8d8d4f764af62.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 24 Nov 2020 21:59:52 +0100
In-Reply-To: <20201124203339.GD3103@octiron.msp.redhat.com>
References: <20201105114952.1059-1-mwilck@suse.com>
	<20201106004115.GH3384@octiron.msp.redhat.com>
	<39c3227eb6fc8c9edb0f8927b180005e5b4ff445.camel@suse.com>
	<20201124203339.GD3103@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [RFC PATCH] libmultipath: prevent DSO unloading with
 astray checker threads
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-24 at 14:33 -0600, Benjamin Marzinski wrote:
> On Fri, Nov 06, 2020 at 06:32:16PM +0100, Martin Wilck wrote:
> > On Thu, 2020-11-05 at 18:41 -0600, Benjamin Marzinski wrote:
> > > I can't make this segfault. So that looks good, but it does need
> > > libmultipath.version updated to include checker_thread_entry()
> > 
> > Great news, thanks. Well the library version stuff hasn't been
> > committed yet anyway, this was against Christophe's current base.
> 
> Actually, I ran into a different segfault with this patch.
> 
> While the tur checker's libcheck_check() function is run under
> locking,
> so the device cannot be removed, The thread it creates is not. This
> means that it is possible for the device to get removed after
> libcheck_check() runs, but before checker_thread_entry() runs. In
> this
> case, when checker_thread_entry() is finally run, the passed in
> checker
> structure would already have been freed, causing a segfault.  I have
> been able to easily reproduce this in the case where multipath device
> creation failed in the kernel.
> 
> I'm pretty sure that the checker class needs its ref count increased
> before the thread is created, and the thread inself must only access
> the
> context, which should include a pointer to the class.
> 

Thanks for pointing this out. I'll have another look. 

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

