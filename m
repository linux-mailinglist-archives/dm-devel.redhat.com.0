Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 418C1400400
	for <lists+dm-devel@lfdr.de>; Fri,  3 Sep 2021 19:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630689509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3RaqSR6EjGMTkpW45ezoXQyfzh3WuUgm+zhKvlxbn6o=;
	b=JhwuHEEePwK7YQsAi/slOVf4eTYb3+CUJ1jSoqj4P/38W++SHSUUtJFaT9BMNWFkSXriCv
	DYHVRzJvmv2gkRjLZMwMVVKg6ubnceGEu5lTuiT7B5jynOHd45GVHiENsGYBwvv4C0YCPw
	y92Ao7cKWuv40YPD9NGEOk9b34sOQqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-dB78ymohNIqpjwy9veElSw-1; Fri, 03 Sep 2021 13:18:27 -0400
X-MC-Unique: dB78ymohNIqpjwy9veElSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC543802947;
	Fri,  3 Sep 2021 17:18:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE15578C3D;
	Fri,  3 Sep 2021 17:18:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 667F444A59;
	Fri,  3 Sep 2021 17:18:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183HHQd7010131 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 13:17:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 96EAF5C232; Fri,  3 Sep 2021 17:17:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 868075C1C5;
	Fri,  3 Sep 2021 17:17:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 183HHL4d018729; 
	Fri, 3 Sep 2021 12:17:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 183HHKLB018728;
	Fri, 3 Sep 2021 12:17:20 -0500
Date: Fri, 3 Sep 2021 12:17:20 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210903171720.GF3087@octiron.msp.redhat.com>
References: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
	<1630619869-12251-7-git-send-email-bmarzins@redhat.com>
	<933d61399192f5e5064054d29488680de0dc7970.camel@suse.com>
	<05c0b2e043dfb7e8e024f5ebefcec55bdb7b3762.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <05c0b2e043dfb7e8e024f5ebefcec55bdb7b3762.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 6/6] libmultipath: drop unnecessary
 parameter from remove_map()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 03:22:45PM +0000, Martin Wilck wrote:
> On Fri, 2021-09-03 at 11:28 +0200, Martin Wilck wrote:
> > On Thu, 2021-09-02 at 16:57 -0500, Benjamin Marzinski wrote:
> > > When remove_map() is called, if the multipath device is in a mpvec,
> > > it
> > > must be removed from it, because the device will be freed. Now that
> > > the
> > > mpvec is passed as a separate parameter to remove_map(), the
> > > purge_vec
> > > parameter is redundant.=A0 It was only used by coalesce_paths(),
> > > since
> > > the
> > > multipath device isn't on any vector when remove_map() is called
> > > there.
> > > Instead, remove_map() can just be called with a NULL mpvec, when
> > > there
> > > is no mpvec to remove the device from.
> > >=20
> > > remove_map_by_alias() also has a redundant purge_vec parameter.=A0
> > > Since
> > > it only removes a map if it finds in on vec->mpvec, calling it with
> > > KEEP_VEC would be a bug, since it would leave a pointer to the
> > > freed
> > > device in the vector.
> > >=20
> > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> >=20
> > Good catch. But we need to adapt libmultipath.version. I'll send a
> > fix
> > to be added on top.
> >=20
> > Reviewed-by: Martin Wilck <mwilck@suse.com>
>=20
> This breaks the directio test, too. We need a test patch on top.
> I'm going to post it.

Oops. Thanks.

-Ben

>=20
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

