Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECBFFBA7A
	for <lists+dm-devel@lfdr.de>; Wed, 13 Nov 2019 22:12:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573679574;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MloXHoVxk0QwhC7Tge9h5LIgu8hiD5wkXFUn3ccxlXk=;
	b=OlIQjlVSRmPMj0e5TbpubnrJ/5KAH+jH2F8UJ4nEyIdyRZBRm7z+HnJRiCcrcV72v2NS7b
	lqz9wdKnOBr8iy+mM0Tiid8xvBaC3Bx2cuQVrhYVbvMgiKJ8ionWM0CXwVwsZfKwMFD10h
	mg8Ft7QGH1ZMS5BSgA4/vtuCL4QtRDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-tKQwhowmOrup7mPLmdMrQw-1; Wed, 13 Nov 2019 16:12:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D1F5804AD4;
	Wed, 13 Nov 2019 21:12:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 596A25F78B;
	Wed, 13 Nov 2019 21:12:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7D2118034E9;
	Wed, 13 Nov 2019 21:12:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLCGPI004559 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:12:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18B49503A7; Wed, 13 Nov 2019 21:12:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4E760BE0;
	Wed, 13 Nov 2019 21:12:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xADLC8H9032289; 
	Wed, 13 Nov 2019 15:12:08 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xADLC6Ov032288;
	Wed, 13 Nov 2019 15:12:06 -0600
Date: Wed, 13 Nov 2019 15:12:06 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.de>
Message-ID: <20191113211206.GF30153@octiron.msp.redhat.com>
References: <cd8528f6f2224121ab586f9cd05bf87c@h3c.com>
	<996e9408b64fabe3337d55937acd2c22b9b89792.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <996e9408b64fabe3337d55937acd2c22b9b89792.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Wangyong <wang.yongD@h3c.com>, Chengchiwen <chengchiwen@h3c.com>,
	Guozhonghua <guozhonghua@h3c.com>, Zhangguanghui <zhang.guanghui@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Changlimin <changlimin@h3c.com>, Wangxibo <wang.xibo@h3c.com>,
	Chongyun Wu <wu.chongyun@h3c.com>,
	"Martin Wilck \(mwilck@suse.com\)" <mwilck@suse.com>
Subject: Re: [dm-devel] [PATCH] multipathd: fix mpp->nr_active more than
 actually active
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
X-MC-Unique: tKQwhowmOrup7mPLmdMrQw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Nov 13, 2019 at 09:32:33AM +0100, Martin Wilck wrote:
> On Wed, 2019-11-13 at 07:16 +0000, Chongyun Wu wrote:
> > Hi Martin, Ben and other viewers
> >=20
> > Cloud you help to view below patch, we have reproduce this issue and
> > found a way to fix it, thanks.
> >=20
> > From b3e5d5919668b03185a039fb54962c47d339bb54 Mon Sep 17 00:00:00
> > 2001
> > From: Chongyun Wu <wu.chongyun@h3c.com>
> > Date: Wed, 13 Nov 2019 14:52:07 +0800
> > Subject: [PATCH] multipathd: fix mpp->nr_active more than actually
> > active
> >  paths count
> >=20
> > In check_path if path check thread not return in next round check but
> > return before timeout happen, the path state will be PAHT_PENDING,
> > when return up check_path will try to call reinstate_path, in this
> > situation should not pass add_active=3D1 into reinstate_path func as
> > parameter, other wise the mpp->nr_active will bigger than actually
> > active paths count.
> >=20
> > We have a environment can reproduce this issue, with this patch issue
> > not found again.
>=20
> I wonder how this can happen. In my opinion pp->state can never be set
> to PATH_PENDING, and thus oldstate can never have that value, either.
>=20
> Are you running the latest upstream code? In particular, do you have=20
> e224d57a13cb ("libmutipath: continue to use old state on
> PATH_PENDING")?

Not that it matters to the correctness of this patch, bub that commit
does allow pp->state to be set to PATH_PENDING. It's just pretty
convoluted.  You need two calls to pathinfo, the first needs to set the
path state to PATH_WILD or PATH_UNCHECKED, and a later one needs to set
the path state to PATH_PENDING. Then the path will be in a PATH_PENDING
state during the call to check path. Perhaps pathinfo should never set a
path's state to PATH_WILD, PATH_UNCHECKED, or PATH_PENDING, unless it is
already one of those values.

But I still don't see how the patch helps. check_path() calls
set_no_path_retry(), which will recalculate nr_active, counting any path
not in PATH_UP or PATH_GHOST as down.  Because of this, it should always
be correct to set add_active when a path changes from a state that isn't
PATH_UP or PATH_GHOST to one of those states. Do you know why this
wouldn't be happening in your scenario?=20

> Anyway, the ongoing struggle to get nr_active right bothers me.
>=20
> @Ben, I'm inclined to remove nr_active altogether and calculate it on
> the fly. What do you think?

I would happily ACK a patch that always calculated the current number of
active paths on the fly.

> Regards
> Martin
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

