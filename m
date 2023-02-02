Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F78688168
	for <lists+dm-devel@lfdr.de>; Thu,  2 Feb 2023 16:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675350882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i56itEjJb1nDRYqlHZddrlnm2GbwKmOjPlwsEaGhj38=;
	b=GQQKQoEFGS818Vqzti9D2oLudToZPyEckrZOTDioBGfivlc9RXmY9svP9BwNz0YHOFjX31
	ugCecKWdMqJ6+LEg0JRaFwV4OdVOtaD6NC9PnDPQwEC/VPu7seudMTZtwEYa5rO4vwFnU5
	PiV96ueWB3qq5B0gsFIZevsCAnw1DyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-5kafE0m0OJub2v_aGig0iw-1; Thu, 02 Feb 2023 10:14:39 -0500
X-MC-Unique: 5kafE0m0OJub2v_aGig0iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CFC985CBE6;
	Thu,  2 Feb 2023 15:14:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AF54404CD81;
	Thu,  2 Feb 2023 15:14:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D97519465B8;
	Thu,  2 Feb 2023 15:14:32 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 966E41946586
 for <dm-devel@listman.corp.redhat.com>; Thu,  2 Feb 2023 15:14:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 85430492C1B; Thu,  2 Feb 2023 15:14:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38FC7492C18;
 Thu,  2 Feb 2023 15:14:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 312FETO2015672;
 Thu, 2 Feb 2023 09:14:30 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 312FETBc015671;
 Thu, 2 Feb 2023 09:14:29 -0600
Date: Thu, 2 Feb 2023 09:14:29 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20230202151429.GB17327@octiron.msp.redhat.com>
References: <1675266989-8281-1-git-send-email-bmarzins@redhat.com>
 <5cfc86dfe02c991f1aacb75a6c2ccfce289f298b.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <5cfc86dfe02c991f1aacb75a6c2ccfce289f298b.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH v2 0/4] multipath: fix multipathd renaming
 issue
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
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 08:44:53AM +0000, Martin Wilck wrote:
> On Wed, 2023-02-01 at 09:56 -0600, Benjamin Marzinski wrote:
> > If a multipath device needs to be renamed and reloaded when
> > multipathd
> > starts, it will only get reloaded. This can happen if the multipath
> > configuration is different between the initramfs and regular
> > filesystem.
> > The only thing that can happen along with a rename is a force reload.
> >=20
> > This patchset makes libmultipath also do all the other actions that
> > are
> > compatible with a rename.
> >=20
> > changes in v2 (as suggested by Martin Wilck)
> > 0004: If the rename is impossible, multipath now checks for other
> > =A0=A0=A0=A0=A0 actions, instead of always returning ACT_IMPOSSIBLE
> >=20
> > Benjamin Marzinski (4):
> > =A0 libmultipath: use select_reload_action in select_action
> > =A0 libmultipath: select resize action even if reload is forced
> > =A0 libmultipath: cleanup ACT_CREATE code in select_action
> > =A0 libmultipath: keep renames from stopping other multipath actions
> >=20
> > =A0libmultipath/configure.c | 107 +++++++++++++++++--------------------
> > --
> > =A0libmultipath/configure.h |=A0=A0 4 +-
> > =A02 files changed, 49 insertions(+), 62 deletions(-)
> >=20
>=20
>=20
> For the series:
>=20
> Reviewed-by: Martin Wilck <mwilck@suse.com>

It looks like you pulled the first version of my patches, without the
fix you suggested for impossible renames, into your queue branch.=20

-Ben
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

