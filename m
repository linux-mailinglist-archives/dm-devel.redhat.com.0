Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AAB7986B6
	for <lists+dm-devel@lfdr.de>; Fri,  8 Sep 2023 14:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694174761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=q0nC6lNuvBitbUNK8MObfOWQL+42kgTvpnwzcmEjklg=;
	b=RZb6lOdKL0ONGXmjXe+aCaS1qfHHDY8w7XGVUKhrLThFAEkxr/nKFJm9VMNE2hucwoBIXh
	kJDltjdcv1iBi1n5HrECX9T24/edOx4RgDO1Ttx+Mp3cFpnmAukIhWB3E1Y5GtsbU+UYfZ
	6KI2tijpG9uhc4slGqvcYWHXTJQUeUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-eFsk2VR9N-Gn80PVMLqo9Q-1; Fri, 08 Sep 2023 08:05:58 -0400
X-MC-Unique: eFsk2VR9N-Gn80PVMLqo9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F39081817934;
	Fri,  8 Sep 2023 12:05:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81FF41121314;
	Fri,  8 Sep 2023 12:05:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E5C3A19465B3;
	Fri,  8 Sep 2023 12:05:54 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1AFE194658C
 for <dm-devel@listman.corp.redhat.com>; Fri,  8 Sep 2023 12:05:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B19CC40C6CCC; Fri,  8 Sep 2023 12:05:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A983540ED780
 for <dm-devel@redhat.com>; Fri,  8 Sep 2023 12:05:53 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C3F538157C1
 for <dm-devel@redhat.com>; Fri,  8 Sep 2023 12:05:53 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-espSB3JLMUaEPldVGR5Dxg-1; Fri,
 08 Sep 2023 08:05:50 -0400
X-MC-Unique: espSB3JLMUaEPldVGR5Dxg-1
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id E07661C0019; Fri,  8 Sep 2023 13:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1694174362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pgszQD84t0zWFYtdlm4co33mPCbsZOXmieVbxsc8Tu0=;
 b=KQJ4R4+KQNuGIamlwHNZfjp2dSVDBl+R6ONq5VGA9+welTSi2VRQYjEDUl8tW1XFSrGwTy
 c2Oh41Uvh6ViJZfc9q4RpM9Cj62ySxO78pNrhkQYp3/wUpIdBYEEzh+6x+UJ2FJfHBXwEq
 GekWoxjSfU/nA2a3b19axQx2jFgDC+E=
Date: Fri, 8 Sep 2023 13:59:22 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZPsMmjFXGFmdRP+d@duo.ucw.cz>
References: <59b54cc3-b98b-aff9-14fc-dc25c61111c6@redhat.com>
 <20230906-launenhaft-kinder-118ea59706c8@brauner>
 <f5d63867-5b3e-294b-d1f5-a128817cfc7@redhat.com>
 <20230906-aufheben-hagel-9925501b7822@brauner>
 <60f244be-803b-fa70-665e-b5cba15212e@redhat.com>
 <20230906-aufkam-bareinlage-6e7d06d58e90@brauner>
 <818a3cc0-c17b-22c0-4413-252dfb579cca@redhat.com>
 <20230907094457.vcvmixi23dk3pzqe@quack3>
MIME-Version: 1.0
In-Reply-To: <20230907094457.vcvmixi23dk3pzqe@quack3>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH] fix writing to the filesystem after unmount
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Christian Brauner <brauner@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Zdenek Kabelac <zkabelac@redhat.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============6540658864538917197=="
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3


--===============6540658864538917197==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VV/11Z1/4RYJMo7q"
Content-Disposition: inline


--VV/11Z1/4RYJMo7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2023-09-07 11:44:57, Jan Kara wrote:
> On Wed 06-09-23 18:52:39, Mikulas Patocka wrote:
> > On Wed, 6 Sep 2023, Christian Brauner wrote:
> > > On Wed, Sep 06, 2023 at 06:01:06PM +0200, Mikulas Patocka wrote:
> > > > > > BTW. what do you think that unmount of a frozen filesystem shou=
ld properly=20
> > > > > > do? Fail with -EBUSY? Or, unfreeze the filesystem and unmount i=
t? Or=20
> > > > > > something else?
> > > > >=20
> > > > > In my opinion we should refuse to unmount frozen filesystems and =
log an
> > > > > error that the filesystem is frozen. Waiting forever isn't a good=
 idea
> > > > > in my opinion.
> > > >=20
> > > > But lvm may freeze filesystems anytime - so we'd get randomly retur=
ned=20
> > > > errors then.
> > >=20
> > > So? Or you might hang at anytime.
> >=20
> > lvm doesn't keep logical volumes suspended for a prolonged amount of ti=
me.=20
> > It will unfreeze them after it made updates to the dm table and to the=
=20
> > metadata. So, it won't hang forever.
> >=20
> > I think it's better to sleep for a short time in umount than to return =
an=20
> > error.
>=20
> I think we've got too deep down into "how to fix things" but I'm not 100%
> sure what the "bug" actually is. In the initial posting Mikulas writes "t=
he
> kernel writes to the filesystem after unmount successfully returned" - is
> that really such a big issue? Anybody else can open the device and write =
to
> it as well. Or even mount the device again. So userspace that relies on
> this is kind of flaky anyway (and always has been).

Umm. No? I admin my own systems; I'm responsible for my
userspace. Maybe I'm in single user mode.

Noone writes to my block devices without my permissions.

By mount, I give such permission to the kernel. By umount, I take
such permission away.

There's nothing flaky about that. Kernel is simply buggy. Fix it.

[Remember that "you should umount before disconnecting USB devices to
prevent data corruption"? How is that working with kernel writing to
devices after umount?]

Best regards,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--VV/11Z1/4RYJMo7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZPsMmgAKCRAw5/Bqldv6
8jwpAKCloP9g2vbKKoXzhQ/ur0UU/OPQBQCfYxXaWEstMzVxbkv+WoWbEeYTPxE=
=jKlj
-----END PGP SIGNATURE-----

--VV/11Z1/4RYJMo7q--


--===============6540658864538917197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============6540658864538917197==--

