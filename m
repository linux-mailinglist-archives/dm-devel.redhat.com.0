Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8913FFAF84
	for <lists+dm-devel@lfdr.de>; Wed, 13 Nov 2019 12:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573643842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PFNDPSigVOT/1PmrcHr/BbNQXKaTaqLvK0hB7MtyYX8=;
	b=gvFX3FoTYPHP4dIa1n53BLPWegUkpzEi8MXN4sBOgAqC17sanST3rAj9M+E16CC7Jc3Qho
	lSCNA81f42zJo+vRMa+3TZDrA2H5ELWBOWGV5tfFRKm5h8XjcI8dSRAlGGtt+4rTKGLL3R
	jsFOXioVndIzf5AIVnNmp2PozuL+DoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-wW1E3JdlMDaJ3TK_QM6FsA-1; Wed, 13 Nov 2019 06:17:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F43477;
	Wed, 13 Nov 2019 11:17:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9D6E101E818;
	Wed, 13 Nov 2019 11:17:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 149471808855;
	Wed, 13 Nov 2019 11:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADBGj2s032357 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 06:16:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5500764044; Wed, 13 Nov 2019 11:16:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A0750FC7;
	Wed, 13 Nov 2019 11:16:42 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xADBGgKS023444; Wed, 13 Nov 2019 06:16:42 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xADBGfRf023440; Wed, 13 Nov 2019 06:16:41 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 13 Nov 2019 06:16:41 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Nikos Tsironis <ntsironis@arrikto.com>
In-Reply-To: <335dafcb-5e07-63ed-b288-196516170bde@arrikto.com>
Message-ID: <alpine.LRH.2.02.1911130616240.20335@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
	<335dafcb-5e07-63ed-b288-196516170bde@arrikto.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, linux-rt-users@vger.kernel.org,
	Daniel Wagner <dwagner@suse.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, tglx@linutronix.de,
	Scott Wood <swood@redhat.com>
Subject: Re: [dm-devel] [PATCH RT 2/2 v2] list_bl: avoid BUG when the list
 is not locked
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: wW1E3JdlMDaJ3TK_QM6FsA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable



On Wed, 13 Nov 2019, Nikos Tsironis wrote:

> On 11/12/19 6:16 PM, Mikulas Patocka wrote:
> > list_bl would crash with BUG() if we used it without locking. dm-snapsh=
ot=20
> > uses its own locking on realtime kernels (it can't use list_bl because=
=20
> > list_bl uses raw spinlock and dm-snapshot takes other non-raw spinlocks=
=20
> > while holding bl_lock).
> >=20
> > To avoid this BUG, we must set LIST_BL_LOCKMASK =3D 0.
> >=20
> > This patch is intended only for the realtime kernel patchset, not for t=
he=20
> > upstream kernel.
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
>=20
> Hi Mikulas,
>=20
> I think removing __set_bit()/__clear_bit() breaks hlist_bl_is_locked(),
> which is used by the RCU variant of list_bl.
>=20
> Nikos

OK. so I can remove this part of the patch.

Mikulas

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
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

