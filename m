Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469E73D2B8
	for <lists+dm-devel@lfdr.de>; Sun, 25 Jun 2023 19:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687714813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xpKWURbmVkiXneqLaBSexR+eiGS/BLfVvhU8xtKI6r8=;
	b=TmVIvtBBR3IvYrzgRWth4GuehbtdH0V+CB11Uu10sSy+GBXGgAtj2OUw2vMisSfJA1bmf/
	OhfXuKVKbylP0cxZMD+w1ibHQV2W7st/aHZGpoS2ie3di0b/HEQV/GT9tZlqHbuMKQCQyP
	nnFqa1/dc64r2v5Ioql4myDfB7oiqAs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-SyBUK2MRPz6TWhxWmALzbg-1; Sun, 25 Jun 2023 13:40:10 -0400
X-MC-Unique: SyBUK2MRPz6TWhxWmALzbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06723185A791;
	Sun, 25 Jun 2023 17:40:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2D7C00049;
	Sun, 25 Jun 2023 17:39:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C8CB81946A52;
	Sun, 25 Jun 2023 17:39:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 714071946587
 for <dm-devel@listman.corp.redhat.com>; Sun, 25 Jun 2023 17:39:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 218E940C6CD1; Sun, 25 Jun 2023 17:39:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A87E40C6CCD
 for <dm-devel@redhat.com>; Sun, 25 Jun 2023 17:39:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00B7885A58A
 for <dm-devel@redhat.com>; Sun, 25 Jun 2023 17:39:50 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-oJNY0WrfPy-2Uw5VqEJKhw-1; Sun, 25 Jun 2023 13:39:46 -0400
X-MC-Unique: oJNY0WrfPy-2Uw5VqEJKhw-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E2F655C00E5;
 Sun, 25 Jun 2023 13:39:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 25 Jun 2023 13:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1687714785; x=1687801185; bh=tSOnCU1jdE2Y3ajgGsj8bKo8BCzDnURUwG0
 RPc5t9dI=; b=RQqBlBK4//iZS1+Rg7dhRh26EJTVKaDfQHbI1OQ6VzyiRt0PwFt
 zFBoOnnLJZElwh11wK3pU3SXf8Ha6yiaoRLybNGWoYMkK+H2g5ft+95gQWuTty5g
 x2EK6WnFMFzcjDWVLNPOB934NJVIGOdHin8O4+ILsu3PXifEedMeIAy+O3JuFRw4
 vKwF98iIKiQHn594tQD2iNMDPdesLOJ6OOhn17pBOCJNPNVuBRQnaOJcqUdxDQxF
 Gg0jtjxnA6BHRr6jn4/qcU32aC25XwgVH+qf2xM2PUURORycwfGWIhS1p93E+YBy
 a+2aCC1VVL3wpPRFggKcnd18xEGqbddT5+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1687714785; x=1687801185; bh=tSOnCU1jdE2Y3
 ajgGsj8bKo8BCzDnURUwG0RPc5t9dI=; b=QOLggROpkwTV01yA9CP28SpYq4TSy
 RulnzzSuyXAXYAib0XtxHE07nWcbWpx7cL6UPHceJSz4cPwFD/Se8et6PwZwag3/
 SpRDNPMcNMFEQMdpqZ0QkgNC+o77RHmZFynnBwEw8dMrQEchC7kDS8cAwUCsFCqT
 g6p/ayZ4vvP2sCsAkIdsNJMFSrZ+fKfIWxlfvzz1JOL9+Hi55YpxH9aGD1nh9jmD
 yZvpVWce6VC4AXaeQxkoG7JBfb15SGSrVDM6gYT5If8mmoP9niSeitxZZz6sW8UY
 vmIM8uNpbEkSfmfrNuu4YwiBYMyDBAysj5CHuMGN4OgoP+Xnr9bqD75mQ==
X-ME-Sender: <xms:4XuYZPBG4VOrIe20bKlvUqaP0Cw__uQ3U0X64TZfceuV_DlEyWu_dw>
 <xme:4XuYZFjw3OlcoyxIkljW8BY8CmNnFMkVfYDnhgD3Rj94aTwCyzrnzsOoSx2dIT5To
 Qc6CWWUJGQQA3A>
X-ME-Received: <xmr:4XuYZKm9geteHztyKWK6AhIha67HNeaVYxMO17bD5uGQXoeRDecR0VEymmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehtddguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
 ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
 hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeejueekheekgeeitdegkeek
 leetvdfhuddufefgffehffehueevvdeileefhfenucffohhmrghinhepkhgvrhhnvghlrd
 horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:4XuYZBwDU4HSSUd_mzySgEmoK7kZImIbDCKjigPUKooqs6tnmAOtjw>
 <xmx:4XuYZEQ_NwfQolIg_Uld3al4suuKNM_llltqPSQIO5Et909ufkQ47g>
 <xmx:4XuYZEak84CtUx4K04uEmrJpE116PAnzpaBchRd-0BMwC2Dqthmhzg>
 <xmx:4XuYZKcMNhAAkSnvnapOC4hKpSh3WTKSJQn5IUfKEajFYwlmR90ghw>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jun 2023 13:39:45 -0400 (EDT)
Date: Sun, 25 Jun 2023 13:39:40 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Markus Elfring <Markus.Elfring@web.de>, dm-devel@redhat.com,
 kernel-janitors@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>
Message-ID: <ZJh73z2CsgHEJ4iv@itl-email>
References: <20230624230950.2272-3-demi@invisiblethingslab.com>
 <3241078c-2318-fe1b-33cc-7c33db71b1a6@web.de>
MIME-Version: 1.0
In-Reply-To: <3241078c-2318-fe1b-33cc-7c33db71b1a6@web.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v2 2/4] dm ioctl: Allow userspace to provide
 expected diskseq
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
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============7377072911551516263=="
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--===============7377072911551516263==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aPhU4A2G1cD1BrHO"
Content-Disposition: inline


--aPhU4A2G1cD1BrHO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Jun 2023 13:39:40 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Markus Elfring <Markus.Elfring@web.de>, dm-devel@redhat.com,
	kernel-janitors@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] dm ioctl: Allow userspace to provide expected
 diskseq

On Sun, Jun 25, 2023 at 01:23:40PM +0200, Markus Elfring wrote:
> > This can be used to avoid race conditions in which a device is destroyed
> > and recreated with the same major/minor, name, or UUID. =E2=80=A6
>=20
> Please add an imperative change suggestion.

Will fix in v3.

> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.4-rc7#n94
>=20
> Regards,
> Markus

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--aPhU4A2G1cD1BrHO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmSYe98ACgkQsoi1X/+c
IsFkkBAAmUSXHkJKBAZiy67wqmfsJ9//TfJvEM8SN6nWxUMqD8Mzy2VaWlXbKMnW
XfKresVNl4wCqC+VuNQivdZZKKYsYi2vHn9UZYrXrD825qRDLh91gP/VVoPCchlZ
SRHo9BuAL/rWTm8am9B2Dcit+1Setvi+nXAW9alP8Gk4IPz/8CB82Mm36noUJO3n
W8vCSvgr1I1l90BgEBr5MzGcHFB7OElii86bkkt+nwc79g7NlfwcXj2ShZj0FENY
BPVOmqf0hAxUdLPPbqbGLLYFyuM7wyZ1uua/Cy4HaOhwbOvK3xlTisqp8fGaJE6b
RnxHnSDBquRzHycsliC7MR425VXlC9VtQZ4Ppqucd+IYZllGHXYelPCKeTjiG0Yg
ZbnoBjUCI952H8oOP4gUkGtWFfRAe69dUOI2jP5bbeJhNQJ2uouvJxFMcVWbhrT1
JP1lEyzCfGYK/SFUPOiP+5zNDR0H7E3slvuNgQZ+mdFNljnGuoLMApE6CQgIwLKv
hwYBnqWa4zQ065nBuzmMAerGRBy6hbQBsec5rR1fmom9K3jucL7OBQ/u5INj2JsR
2jMKBCHoOQIixx6rSicr1aqqLkmujGZwmjgip27zRuz5kHHPoEy20q93QE7dSyS4
sFrexjo5BG80rKn7+NQtUXziPf6Vm4ZIE0SMptj1sh4Ulri9SN0=
=xuAA
-----END PGP SIGNATURE-----

--aPhU4A2G1cD1BrHO--


--===============7377072911551516263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============7377072911551516263==--

