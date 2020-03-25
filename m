Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5551933A2
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 23:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585174388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QLQ9Hji6m9Ws5Z35HGq9H3TbVunpm7zEG/j7VlbId78=;
	b=CNeH8QER6yOBmoTLI6ax2SVjpTRbq+1aK0hCQvLr1Bb6WaZt9SaZV0N1wVqv0OVTXZgsI8
	QrMVSb5OvWMZM0yfaZ2wf+61zzxcmS0s2rPlvwCptH4Tkd+OtyAKtqbnQCmINktiyw2FkU
	W4yTQTFhCA6UXICkPRpByUJdzkIQ9k8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-T2_reUzBOXmJZ-bXzUCeEA-1; Wed, 25 Mar 2020 18:13:05 -0400
X-MC-Unique: T2_reUzBOXmJZ-bXzUCeEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1964107ACCA;
	Wed, 25 Mar 2020 22:12:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A97D5C1B0;
	Wed, 25 Mar 2020 22:12:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE9E6863B9;
	Wed, 25 Mar 2020 22:12:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PMBKk1025462 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 18:11:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 078AA109E86B; Wed, 25 Mar 2020 22:11:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03BBD109E867
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 22:11:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1310F8F7825
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 22:11:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-431-yxOllvFkPASuOgOqixBGMQ-1;
	Wed, 25 Mar 2020 18:11:15 -0400
X-MC-Unique: yxOllvFkPASuOgOqixBGMQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CCFCEAD33;
	Wed, 25 Mar 2020 22:11:13 +0000 (UTC)
Message-ID: <cc2a180a52602e90c94eff1f2c725fd4b93c3927.camel@suse.com>
From: Martin Wilck <martin.wilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
In-Reply-To: <20200325220045.GC17313@octiron.msp.redhat.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-2-git-send-email-bmarzins@redhat.com>
	<ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
	<20200325205255.GB17313@octiron.msp.redhat.com>
	<20200325220045.GC17313@octiron.msp.redhat.com>
MIME-Version: 1.0
Date: Wed, 25 Mar 2020 23:11:00 +0100
User-Agent: Evolution 3.34.4
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PMBKk1025462
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] libmutipath: don't close fd on
 dm_lib_release
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-25 at 17:00 -0500, Benjamin Marzinski wrote:
> On Wed, Mar 25, 2020 at 03:52:55PM -0500, Benjamin Marzinski wrote:
> > On Wed, Mar 25, 2020 at 03:16:50PM +0000, Martin Wilck wrote:
> > > On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> > >=20
> > > AFAICS, this function has been in libdm since 1.02.111. We
> > > support
> > > 1.02.89 (if all features enabled, otherwise even older). Perhaps
> > > we
> > > should make this function call conditional on the libdm verson?
> > >=20
> > > But perhaps more importantly, why do we still need to call
> > > dm_lib_release()? AFAICS it's only needed for systems that have
> > > no udev
> > > support for creating device nodes (to call update_devs() via
> > > dm_lib_release()), and we don't support that anymore anyway, do
> > > we?=20
> > >=20
> > > Since 26c4bb0, we're always setting the
> > > DM_UDEV_DISABLE_LIBRARY_FALLBACK flag, and the cookie, too
> > > (we aren't setting it for DM_DEVICE_RELOAD, but it isn't needed
> > > for
> > > that, either, since no device nodes need to be created or
> > > removed); so
> > > dm_lib_release() should really have no effect.
> > >=20
> > > Regards
> > > Martin
> >=20
> > Good call. I'll redo this patch.
>=20
> Actually, I've changed my mind. Calling dm_lib_release() lets us
> release
> the memory that device-mapper uses to store all the node ops that it
> was saving up.  Without calling dm_lib_release(), AFAICS, that memory
> keeps growing until the daemon exits.

Ok, I see. libdm stacks the node ops, even if it's told to rely on
udev. The question is, what for, as it will discard the stacked nodes
later on anyway.=20

Fine, then. But please add a check for the libdm version.

Thanks,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

