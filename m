Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B67AD275314
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 10:17:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-b5yCRm4OMVm2cmxsng1JOA-1; Wed, 23 Sep 2020 04:17:39 -0400
X-MC-Unique: b5yCRm4OMVm2cmxsng1JOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 276321007B01;
	Wed, 23 Sep 2020 08:17:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFDF5190AE;
	Wed, 23 Sep 2020 08:17:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E84F6181A050;
	Wed, 23 Sep 2020 08:17:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08N8Gtps003100 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 04:16:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 004B5115D341; Wed, 23 Sep 2020 08:16:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF0ED115D340
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 08:16:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A3F101A540
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 08:16:52 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-55-7h2kPUMyNiSfi4BFjlyteA-1;
	Wed, 23 Sep 2020 04:16:50 -0400
X-MC-Unique: 7h2kPUMyNiSfi4BFjlyteA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0F49CAF34;
	Wed, 23 Sep 2020 08:17:26 +0000 (UTC)
Message-ID: <3c33e8dc3355a444d58bff8d5ccc24515931c523.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 23 Sep 2020 10:16:48 +0200
In-Reply-To: <20200921201052.GY11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
	<20200916153718.582-18-mwilck@suse.com>
	<20200921201052.GY11108@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 17/19] libmultipath: add udev and logsink
	symbols
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

On Mon, 2020-09-21 at 15:10 -0500, Benjamin Marzinski wrote:
> 
> After calling libmultipath_exit(), you can never reinitialized the
> udev
> device.  That seems fine, but it should probably set udev to null, so
> that future calls to libmultipath_init() don't return success. Either
> that or multipath_init() should use a mutex instead of pthread_once()
> to
> avoid races, so that you can reinitialize udev after a call to
> libmultipath_exit().

I've been thinking about this some more. It makes a lot of sense to
move more cleanup code into libmultipath_exit() in the future; thus
this function will do more than just clean up "udev". I believe calling
libmultipath_exit() will become the only supported way to clean up
libmultipath, and basically mandatory, rather sooner than later. 

The handling of "udev" is the main cause of headache, because we don't
know whether the application wants to continue to use the variable
after libmultipath_exit(). In libmultipath_exit(), we can't determine
if "udev" is the symbol from libmultipath or from some other object
file. It's also impossible to tell by the return value of udev_unref()
whether or not it destroyed the variable. Setting udev to NULL is
dangerous if the uevent listener thread is still running, or if the
application needs to use the variable further.

So this is my current idea for a "robust" design:

1. libmultipath_init() initializes udev if it's NULL; otherwise, it
   simply takes an additional ref. IOW, applications may (but
   don't have to) initialize and use udev before calling
   libmultipath_init().
2. libmultipath_exit() calls udev_unref(udev), without nullifying it.
   Thus applications may continue using udev afterwards, if they own an
   additional reference.
3. libmultipath_init() always fails after calling libmultipath_exit().
4. Other libmultipath calls after libmultipath_exit() may cause
   undefined behavior.
5. Normal usage would be to call libmultipath_exit() at program exit.
6. Calling libmultipath_init() is currently only mandatory for
   programs that don't initialize "udev" themselves. This may change
   in the future.
7. Calling libmultipath_exit() will be mandatory for programs that
   wish to avoid memory leaks.

The only downside that I see is that the application can't test whether
"udev" is valid by checking if it's NULL. But that's by design of
udev_unref(). The application needs to track its own references.

There is no rigorous reason for (3.). In principle, we could just
handle re-initialization like (1.). But I don't think it's worth the
effort of figuring out all possible ways in which re-initialization
could go wrong, in particular if we want to initialize more stuff
later.

Does this make sense? 
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

