Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C239737FE66
	for <lists+dm-devel@lfdr.de>; Thu, 13 May 2021 21:49:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-7x8YNlhHMMm8QTP4IUKfVw-1; Thu, 13 May 2021 15:49:26 -0400
X-MC-Unique: 7x8YNlhHMMm8QTP4IUKfVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0265879EC6;
	Thu, 13 May 2021 19:49:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 476491007606;
	Thu, 13 May 2021 19:49:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FC4B18005B6;
	Thu, 13 May 2021 19:49:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DJn4hT019344 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 15:49:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED9C7206356F; Thu, 13 May 2021 19:49:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E90F92063563
	for <dm-devel@redhat.com>; Thu, 13 May 2021 19:49:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96C5485828E
	for <dm-devel@redhat.com>; Thu, 13 May 2021 19:49:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-373-OMk1I728NbabgYMSB8F2Tw-1;
	Thu, 13 May 2021 15:48:57 -0400
X-MC-Unique: OMk1I728NbabgYMSB8F2Tw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 68CB2B133;
	Thu, 13 May 2021 19:48:55 +0000 (UTC)
Message-ID: <0e13bbc731e9eb1081126fb43bed0293c9bda5c3.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 13 May 2021 21:48:54 +0200
In-Reply-To: <20210513163559.GI25887@octiron.msp.redhat.com>
References: <20210512211705.31561-1-mwilck@suse.com>
	<20210513163559.GI25887@octiron.msp.redhat.com>
User-Agent: Evolution 3.38.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14DJn4hT019344
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: fix compilation issue with
	liburcu < 0.8
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-05-13 at 11:35 -0500, Benjamin Marzinski wrote:
> >=20
> > diff --git a/multipathd/Makefile b/multipathd/Makefile
> > index d053c1e..dc7eb32 100644
> > --- a/multipathd/Makefile
> > +++ b/multipathd/Makefile
> > @@ -16,6 +16,8 @@ LDFLAGS +=3D $(BIN_LDFLAGS)
> > =A0LIBDEPS +=3D -L$(multipathdir) -lmultipath -L$(mpathpersistdir) -
> > lmpathpersist \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -L$(mpathcmddir) -lmpathcmd -ludev -ldl =
-lurcu -lpthread
> > \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -ldevmapper -lreadline
> > +CFLAGS +=3D $(shell pkg-config --modversion liburcu 2>/dev/null | \
> > +=A0=A0=A0=A0=A0=A0=A0awk -F. '{ printf("-DURCU_VERSION=3D0x%06x\n", 25=
6 * ( 256 *
> > $$1 + $$2) + $$3); }')
>=20
> Shouldn't this be
>=20
> $(shell $(PKGCONFIG) --modversion ...

Thanks for spotting that.

Martin






--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

