Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55F75275CC4
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 18:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600877180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+1ygV3bsEtdZS7A1IA5Q1EsK1aZFnSWHbkDsjknB/0E=;
	b=fjQzESZrrp5eMkbSfdBbYkB8xzH3I+V7jewfiCat5t/OZCic2hgLkZuLHNtSL+aRbwI4e0
	M8k0mv2KPEmmcsg05MMP7ozyMHZmkXTzRNT6LHJYpTEv5GMfzoQZ1WHPVu+T6lsIByznUa
	Luwqz7hAh4WwSu2UMgx1IKD6trQzcKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-C3sTMvnMPxe_GXfA0H0huw-1; Wed, 23 Sep 2020 12:06:17 -0400
X-MC-Unique: C3sTMvnMPxe_GXfA0H0huw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 204A8104D3E5;
	Wed, 23 Sep 2020 16:06:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D0855786;
	Wed, 23 Sep 2020 16:06:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7339183D040;
	Wed, 23 Sep 2020 16:06:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NG5wqq001691 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 12:05:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89E9B55786; Wed, 23 Sep 2020 16:05:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0D0555782;
	Wed, 23 Sep 2020 16:05:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08NG5rGN013932; 
	Wed, 23 Sep 2020 11:05:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08NG5q6n013931;
	Wed, 23 Sep 2020 11:05:52 -0500
Date: Wed, 23 Sep 2020 11:05:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200923160552.GD11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
	<20200916153718.582-18-mwilck@suse.com>
	<20200921201052.GY11108@octiron.msp.redhat.com>
	<3c33e8dc3355a444d58bff8d5ccc24515931c523.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <3c33e8dc3355a444d58bff8d5ccc24515931c523.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 23, 2020 at 10:16:48AM +0200, Martin Wilck wrote:
> On Mon, 2020-09-21 at 15:10 -0500, Benjamin Marzinski wrote:
> > 
> > After calling libmultipath_exit(), you can never reinitialized the
> > udev
> > device.  That seems fine, but it should probably set udev to null, so
> > that future calls to libmultipath_init() don't return success. Either
> > that or multipath_init() should use a mutex instead of pthread_once()
> > to
> > avoid races, so that you can reinitialize udev after a call to
> > libmultipath_exit().
> 
> I've been thinking about this some more. It makes a lot of sense to
> move more cleanup code into libmultipath_exit() in the future; thus
> this function will do more than just clean up "udev". I believe calling
> libmultipath_exit() will become the only supported way to clean up
> libmultipath, and basically mandatory, rather sooner than later. 
> 
> The handling of "udev" is the main cause of headache, because we don't
> know whether the application wants to continue to use the variable
> after libmultipath_exit(). In libmultipath_exit(), we can't determine
> if "udev" is the symbol from libmultipath or from some other object
> file. It's also impossible to tell by the return value of udev_unref()
> whether or not it destroyed the variable. Setting udev to NULL is
> dangerous if the uevent listener thread is still running, or if the
> application needs to use the variable further.
> 
> So this is my current idea for a "robust" design:
> 
> 1. libmultipath_init() initializes udev if it's NULL; otherwise, it
>    simply takes an additional ref. IOW, applications may (but
>    don't have to) initialize and use udev before calling
>    libmultipath_init().
> 2. libmultipath_exit() calls udev_unref(udev), without nullifying it.
>    Thus applications may continue using udev afterwards, if they own an
>    additional reference.
> 3. libmultipath_init() always fails after calling libmultipath_exit().
> 4. Other libmultipath calls after libmultipath_exit() may cause
>    undefined behavior.
> 5. Normal usage would be to call libmultipath_exit() at program exit.
> 6. Calling libmultipath_init() is currently only mandatory for
>    programs that don't initialize "udev" themselves. This may change
>    in the future.
> 7. Calling libmultipath_exit() will be mandatory for programs that
>    wish to avoid memory leaks.
> 
> The only downside that I see is that the application can't test whether
> "udev" is valid by checking if it's NULL. But that's by design of
> udev_unref(). The application needs to track its own references.
> 
> There is no rigorous reason for (3.). In principle, we could just
> handle re-initialization like (1.). But I don't think it's worth the
> effort of figuring out all possible ways in which re-initialization
> could go wrong, in particular if we want to initialize more stuff
> later.
> 
> Does this make sense? 

Yeah. After I sent off my message, I realized that there's no way to
know if you dropped the last reference, which means that NULLing out
udev doesn't make sense.

-Ben

> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

