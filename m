Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0A29934E3CE
	for <lists+dm-devel@lfdr.de>; Tue, 30 Mar 2021 11:01:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-QLiy7MkJNd-vaY4Hf5In7A-1; Tue, 30 Mar 2021 05:01:25 -0400
X-MC-Unique: QLiy7MkJNd-vaY4Hf5In7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 451F6107ACCA;
	Tue, 30 Mar 2021 09:01:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D6CB100239A;
	Tue, 30 Mar 2021 09:01:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 104721809C83;
	Tue, 30 Mar 2021 09:01:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12U90u5W022995 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 05:00:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 863102157F26; Tue, 30 Mar 2021 09:00:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E9EC2157F24
	for <dm-devel@redhat.com>; Tue, 30 Mar 2021 09:00:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3200181B7A0
	for <dm-devel@redhat.com>; Tue, 30 Mar 2021 09:00:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-457-VTXCwpxSMimHHFCP2ymEdA-1;
	Tue, 30 Mar 2021 05:00:51 -0400
X-MC-Unique: VTXCwpxSMimHHFCP2ymEdA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B1DAAAEB6;
	Tue, 30 Mar 2021 09:00:49 +0000 (UTC)
Message-ID: <58b3b1e7a8ff1af6a26148e347a82e5e909a0b5b.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 30 Mar 2021 11:00:49 +0200
In-Reply-To: <20210330032329.GM15006@octiron.msp.redhat.com>
References: <20210326212944.3136-1-mwilck@suse.com>
	<20210326212944.3136-4-mwilck@suse.com>
	<20210330032329.GM15006@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12U90u5W022995
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH 3/7] github workflows: add containerized /
 multi-arch tests
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

On Mon, 2021-03-29 at 22:23 -0500, Benjamin Marzinski wrote:
> On Fri, Mar 26, 2021 at 10:29:40PM +0100, mwilck@suse.com=A0wrote:
>=20
> >=20
> > diff --git a/.github/workflows/build-and-unittest.yaml
> > b/.github/workflows/build-and-unittest.yaml
> > index 4173576..bf37b13 100644
> > --- a/.github/workflows/build-and-unittest.yaml
> > +++ b/.github/workflows/build-and-unittest.yaml
> > @@ -1,5 +1,7 @@
> > =A0name: basic-build-and-ci
> > -on:=A0=A0 [push]
> > +on:
> > +=A0 push:
> > +=A0=A0=A0 branches: [master queue tip]

This is broken (commas missing, I'm still not fluent in YAML).
I'll fix this in github without re-posting.

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

