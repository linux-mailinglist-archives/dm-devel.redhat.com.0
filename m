Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7BF2128AB
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 17:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593705189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Df7v9EIiwPyBU7paRQsYktqpPPY4Jnufc+43HMY4NcI=;
	b=Kf3IALhe8RevmN1t/W8LXYcjLligGkeY57zh9S0PLMH9GUgL+zv3W7hEuH0u13Q8w9Pdac
	2lx8s95tRG3ks2d1ebSC5HmmOB6K/nbVG0912BmKmk5dcGLDDKC+Oa/FAv7NbHRDxsf/z0
	EGNgn6NvWDad4flY8iyIr8+CITA6RDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-bmAJB0eQOaGwdMpoCLnXIw-1; Thu, 02 Jul 2020 11:53:07 -0400
X-MC-Unique: bmAJB0eQOaGwdMpoCLnXIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03CA380400A;
	Thu,  2 Jul 2020 15:52:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E7977899;
	Thu,  2 Jul 2020 15:52:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6706A1809547;
	Thu,  2 Jul 2020 15:52:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062FqY6Y021926 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:52:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B8035D9CA; Thu,  2 Jul 2020 15:52:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD4C5DC1E;
	Thu,  2 Jul 2020 15:52:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 062FqUud011508; 
	Thu, 2 Jul 2020 10:52:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 062FqTDZ011507;
	Thu, 2 Jul 2020 10:52:29 -0500
Date: Thu, 2 Jul 2020 10:52:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200702155229.GB11089@octiron.msp.redhat.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
	<1593643176-6206-4-git-send-email-bmarzins@redhat.com>
	<42e56b533d5f87dd8ba4f14351d5aeb3a5b4a7f2.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <42e56b533d5f87dd8ba4f14351d5aeb3a5b4a7f2.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] kpartx: handle alternate bsd disklabel
	location
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jul 02, 2020 at 03:12:58PM +0000, Martin Wilck wrote:
> On Wed, 2020-07-01 at 17:39 -0500, Benjamin Marzinski wrote:
> > bsd disk labels can either be at the start of the second sector, or
> > 64
> > bytes into the first sector, but kpartx only handled the first case.
> > However the second case is what parted creates, and what the linux
> > kernel partition code expects.  kpartx should handle both cases.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
>=20
> I can see that for parted, but not for the kernel
> (https://elixir.bootlin.com/linux/latest/source/block/partitions/msdos.c#=
L368)

https://elixir.bootlin.com/linux/latest/source/block/partitions/osf.c

-Ben

> Anyway:
>=20
> Reviewed-by: Martin Wilck <mwilck@suse.com>
>=20
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

