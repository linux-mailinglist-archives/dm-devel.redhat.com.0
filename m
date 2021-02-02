Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8F2230BAFE
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 10:34:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-8dlj1T2eOsOvzAsik1Ag2Q-1; Tue, 02 Feb 2021 04:34:20 -0500
X-MC-Unique: 8dlj1T2eOsOvzAsik1Ag2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F8B78145E0;
	Tue,  2 Feb 2021 09:34:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F1D9CA0;
	Tue,  2 Feb 2021 09:34:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A88DD180954D;
	Tue,  2 Feb 2021 09:34:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1129Y59l029516 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 04:34:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 57F02111284D; Tue,  2 Feb 2021 09:34:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 543A31112845
	for <dm-devel@redhat.com>; Tue,  2 Feb 2021 09:34:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01E8E80A0BE
	for <dm-devel@redhat.com>; Tue,  2 Feb 2021 09:34:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-303-jnqemEaTNaecW_24OSB9dw-1;
	Tue, 02 Feb 2021 04:33:58 -0500
X-MC-Unique: jnqemEaTNaecW_24OSB9dw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EFC19B049;
	Tue,  2 Feb 2021 09:33:56 +0000 (UTC)
Message-ID: <cd0ffc9a3b4048d022791919a5a99b2298053ad0.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 02 Feb 2021 10:33:56 +0100
In-Reply-To: <20210202031509.GM15006@octiron.msp.redhat.com>
References: <20210128204544.18563-1-mwilck@suse.com>
	<20210202031509.GM15006@octiron.msp.redhat.com>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1129Y59l029516
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/3] multipath: fixes for SAS expanders and
 root FS access
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-02-01 at 21:15 -0600, Benjamin Marzinski wrote:
> On Thu, Jan 28, 2021 at 09:45:41PM +0100, mwilck@suse.com=A0wrote:
> > From: Martin Wilck <mwilck@suse.com>
> >=20
> > Hi Christophe, hi Ben,
> >=20
> > here are 3 patches I'd like to get reviewed before we create a pull
> > request. The first two are related to complex SAS setups, the
> > second
> > one is to avoid accessing the root file system in a possible
> > dangerous
> > situation.
> >=20
> > Wrt 2/3: while testing it, I discovered that
> > "I_T_nexus_loss_timeout"
> > is a read-only sysfs attribute, therefore this code does nothing.
> > I considered removing it altogether, observing that the attribute
> > has
> > been read-only as long as it existed (v2.6.17, 2006). I'd like some
> > feedback beforehand, though, perhaps some distros use patched
> > kernels
> > that make this attribute r/w?
>=20
> I_T_nexus_loss_timeout appears to have always been read-only on RHEL
> and
> Fedora.

Thanks. Anyway, given that we're preparing a submission to Christophe,
I'd like to give people more time for responding. We can remove this
code later.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

