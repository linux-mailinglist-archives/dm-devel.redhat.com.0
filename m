Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59A37F8E79
	for <lists+dm-devel@lfdr.de>; Tue, 12 Nov 2019 12:22:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573557767;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mBiUKpLwlAOZlSRxtafKoNVBY7UUZsLWkm6H8kSp5rI=;
	b=eqgaxAgXa7M85srlPurxrBFFE8HelQI/3Pulyb07TEW0iTbjX7FDVxlaQ4awDgV1ey+GkA
	GJARG5U3Xrcez6FU6fQ/Ml7naqjgGhKqJQo+TMEw2q1x2yQF1r04/5gWY0yrOwJ8nf150h
	Z/F2L4oR1qMF0zm1ZoUO0tLNDsJYA8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-42G3ybG4OuaL2cVdW0wh2g-1; Tue, 12 Nov 2019 06:22:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C07477;
	Tue, 12 Nov 2019 11:22:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A65B66292A;
	Tue, 12 Nov 2019 11:22:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58B634BB65;
	Tue, 12 Nov 2019 11:22:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xACBM2N4024997 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Nov 2019 06:22:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 11E6C63644; Tue, 12 Nov 2019 11:22:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF8B561F58;
	Tue, 12 Nov 2019 11:21:58 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xACBLwIp017787; Tue, 12 Nov 2019 06:21:58 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xACBLwbZ017783; Tue, 12 Nov 2019 06:21:58 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 12 Nov 2019 06:21:57 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Daniel Wagner <dwagner@suse.de>
In-Reply-To: <20191112091044.lf7okijocx2wajhk@beryllium.lan>
Message-ID: <alpine.LRH.2.02.1911120621030.17732@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1911110853100.30532@file01.intranet.prod.int.rdu2.redhat.com>
	<20191112091044.lf7okijocx2wajhk@beryllium.lan>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, linux-rt-users@vger.kernel.org,
	bigeasy@linutronix.de, Ilias Tsitsimpis <iliastsi@arrikto.com>,
	dm-devel@redhat.com, tglx@linutronix.de, Scott Wood <swood@redhat.com>,
	Nikos Tsironis <ntsironis@arrikto.com>
Subject: Re: [dm-devel] [PATCH 2/2] realtime: avoid BUG when the list is not
 locked
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
X-MC-Unique: 42G3ybG4OuaL2cVdW0wh2g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable



On Tue, 12 Nov 2019, Daniel Wagner wrote:

> [cc: linux-user-rt, Thomas and Sebastian]
>=20
> On Mon, Nov 11, 2019 at 08:59:44AM -0500, Mikulas Patocka wrote:
> > list_bl.h would crash with BUG() if we used it without locking.=20
> > dm-snapshot uses its own locking on readltime kernels, so to avoid this=
=20
> > BUG, we must set LIST_BL_LOCKMASK =3D 0.
> >=20
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> >=20
> > Index: linux-rt-devel/include/linux/list_bl.h
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux-rt-devel.orig/include/linux/list_bl.h=092019-11-07 14:01:51.0=
00000000 +0100
> > +++ linux-rt-devel/include/linux/list_bl.h=092019-11-08 10:12:49.000000=
000 +0100
> > @@ -19,7 +19,7 @@
> >   * some fast and compact auxiliary data.
> >   */
> > =20
> > -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
> > +#if (defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)) && !define=
d(CONFIG_PREEMPT_RT_BASE)
>=20
> CONFIG_PREEMPT_RT_BASE is only available in the out of tree -rt patch
> set, therefore I assume it's not for mainline, right?

Yes - this is intended to be applied to the realtime patchset.

Mikulas

> >  #define LIST_BL_LOCKMASK=091UL
> >  #else
> >  #define LIST_BL_LOCKMASK=090UL
> > @@ -161,9 +161,6 @@ static inline void hlist_bl_lock(struct
> >  =09bit_spin_lock(0, (unsigned long *)b);
> >  #else
> >  =09raw_spin_lock(&b->lock);
> > -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
> > -=09__set_bit(0, (unsigned long *)b);
> > -#endif
> >  #endif
> >  }
> > =20
> > @@ -172,9 +169,6 @@ static inline void hlist_bl_unlock(struc
> >  #ifndef CONFIG_PREEMPT_RT_BASE
> >  =09__bit_spin_unlock(0, (unsigned long *)b);
> >  #else
> > -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
> > -=09__clear_bit(0, (unsigned long *)b);
> > -#endif
> >  =09raw_spin_unlock(&b->lock);
> >  #endif
> >  }
> >=20
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
> >=20
>=20
> Thanks,
> Daniel
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

