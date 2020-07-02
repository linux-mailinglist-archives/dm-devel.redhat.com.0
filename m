Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B7166212DA2
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 22:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593720424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ee7obqq28mVe39hYOCzflBewgyN2UdDzMcZQLQSCeHQ=;
	b=BXFxQM9Ri9ShxAhwVdROP0pg/4MCKNbI8FX1zisTeydLIoTRM0I8clDuar7QEXUVltcHXP
	yuRG+tO02fW4XoS1Lv6k3KGLbb0WB4DyWGM+oE2UEb6iB7a37B5zFPxeB74lP1q5NLXyjT
	k6abvOtj/FYvUoE1fddsPggQfjwKk+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-WlL9m4P7OZ2kW8G07EEiaw-1; Thu, 02 Jul 2020 16:07:01 -0400
X-MC-Unique: WlL9m4P7OZ2kW8G07EEiaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733B157092;
	Thu,  2 Jul 2020 20:06:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 671885C1B0;
	Thu,  2 Jul 2020 20:06:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18FFC1809547;
	Thu,  2 Jul 2020 20:06:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062K6bLO007252 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 16:06:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2495173FE9; Thu,  2 Jul 2020 20:06:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F02873FC0;
	Thu,  2 Jul 2020 20:06:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 062K6XoS012839; 
	Thu, 2 Jul 2020 15:06:33 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 062K6WBE012838;
	Thu, 2 Jul 2020 15:06:32 -0500
Date: Thu, 2 Jul 2020 15:06:32 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200702200632.GH11089@octiron.msp.redhat.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-2-git-send-email-bmarzins@redhat.com>
	<ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
	<20200325205255.GB17313@octiron.msp.redhat.com>
	<20200325220045.GC17313@octiron.msp.redhat.com>
	<4eaae3bfe0c383d23a839483e88ec093883f4e5a.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <4eaae3bfe0c383d23a839483e88ec093883f4e5a.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jul 02, 2020 at 11:52:21AM +0000, Martin Wilck wrote:
> On Wed, 2020-03-25 at 17:00 -0500, Benjamin Marzinski wrote:
> > On Wed, Mar 25, 2020 at 03:52:55PM -0500, Benjamin Marzinski wrote:
> > > On Wed, Mar 25, 2020 at 03:16:50PM +0000, Martin Wilck wrote:
> > > > On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> > > >=20
> > > > AFAICS, this function has been in libdm since 1.02.111. We
> > > > support
> > > > 1.02.89 (if all features enabled, otherwise even older). Perhaps
> > > > we
> > > > should make this function call conditional on the libdm verson?
> > > >=20
> > > > But perhaps more importantly, why do we still need to call
> > > > dm_lib_release()? AFAICS it's only needed for systems that have
> > > > no udev
> > > > support for creating device nodes (to call update_devs() via
> > > > dm_lib_release()), and we don't support that anymore anyway, do
> > > > we?=20
> > > >=20
> > > > Since 26c4bb0, we're always setting the
> > > > DM_UDEV_DISABLE_LIBRARY_FALLBACK flag, and the cookie, too
> > > > (we aren't setting it for DM_DEVICE_RELOAD, but it isn't needed
> > > > for
> > > > that, either, since no device nodes need to be created or
> > > > removed); so
> > > > dm_lib_release() should really have no effect.
> > > >=20
> > > > Regards
> > > > Martin
> > >=20
> > > Good call. I'll redo this patch.
> >=20
> > Actually, I've changed my mind. Calling dm_lib_release() lets us
> > release
> > the memory that device-mapper uses to store all the node ops that it
> > was saving up.  Without calling dm_lib_release(), AFAICS, that memory
> > keeps growing until the daemon exits.
>=20
> Sorry for coming back to this so late. I've just stared at the libdm
> code again.=20
>=20
> We always set DM_UDEV_DISABLE_LIBRARY_FALLBACK. In the standard CREATE
> and REMOVE cases, libdm doesn't stack any operations if this flag is
> set. The only exceptions are=20
>=20
>  a) RESUME operations with DM_ADD_NODE_ON_RESUME set. This happens
> implicity when we create new maps
>  b) RENAME operations
>=20
> In both cases, we call dm_udev_wait() after the libdm operation, which
> calls update_devs() and should thus have the same effect as
> dm_lib_release(). IOW, I still believe we don't need to call
> dm_lib_release() any more.

Sure. But can we leave this patch as is, and remove those calls in a
different patch?

-Ben
=20
> Regards,
> Martin
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

