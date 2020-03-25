Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA0B19333B
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 23:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585173689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4pdv3TRB7XivscvW55MSnDEbPRNQWzUTWYNGQTmnkiM=;
	b=I4qBqBWheqUXWwcWJ7WRAAofVhp1P2+oWQDWDSnNLxOK7wu3haMMiEhnXtV/Iv72zJrAJz
	V5swdj5hYocRR3N7XiEE00rLUG43e+69789HCMkCpL4LtgdIQjzXg5QPWxaWtTDILScuyh
	CA0XrvgGbJB7f4i/hIDN11w2a/s7rHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-n3hQU5e2P0eVjtbckA-slw-1; Wed, 25 Mar 2020 18:01:26 -0400
X-MC-Unique: n3hQU5e2P0eVjtbckA-slw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 735C0189D6C0;
	Wed, 25 Mar 2020 22:01:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A345360BE0;
	Wed, 25 Mar 2020 22:01:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0899A863B9;
	Wed, 25 Mar 2020 22:01:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PM0lJ3025188 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 18:00:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC1005DA7C; Wed, 25 Mar 2020 22:00:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95A795DA7B;
	Wed, 25 Mar 2020 22:00:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02PM0kWs021943; 
	Wed, 25 Mar 2020 17:00:46 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02PM0jnm021942;
	Wed, 25 Mar 2020 17:00:45 -0500
Date: Wed, 25 Mar 2020 17:00:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200325220045.GC17313@octiron.msp.redhat.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-2-git-send-email-bmarzins@redhat.com>
	<ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
	<20200325205255.GB17313@octiron.msp.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200325205255.GB17313@octiron.msp.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Mar 25, 2020 at 03:52:55PM -0500, Benjamin Marzinski wrote:
> On Wed, Mar 25, 2020 at 03:16:50PM +0000, Martin Wilck wrote:
> > On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> >=20
> > AFAICS, this function has been in libdm since 1.02.111. We support
> > 1.02.89 (if all features enabled, otherwise even older). Perhaps we
> > should make this function call conditional on the libdm verson?
> >=20
> > But perhaps more importantly, why do we still need to call
> > dm_lib_release()? AFAICS it's only needed for systems that have no udev
> > support for creating device nodes (to call update_devs() via
> > dm_lib_release()), and we don't support that anymore anyway, do we?=20
> >=20
> > Since 26c4bb0, we're always setting the
> > DM_UDEV_DISABLE_LIBRARY_FALLBACK flag, and the cookie, too
> > (we aren't setting it for DM_DEVICE_RELOAD, but it isn't needed for
> > that, either, since no device nodes need to be created or removed); so
> > dm_lib_release() should really have no effect.
> >=20
> > Regards
> > Martin
>=20
> Good call. I'll redo this patch.

Actually, I've changed my mind. Calling dm_lib_release() lets us release
the memory that device-mapper uses to store all the node ops that it
was saving up.  Without calling dm_lib_release(), AFAICS, that memory
keeps growing until the daemon exits.

-Ben
=20
> -Ben
>=20
> >=20
> > --=20
> > Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> > SUSE  Software Solutions Germany GmbH
> > HRB 36809, AG N=FCrnberg GF: Felix
> > Imend=F6rffer
> >=20
>=20
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

