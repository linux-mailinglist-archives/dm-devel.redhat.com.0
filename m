Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 500F740DD9B
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 17:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631804948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rDADkBtM02KpJ47IKK6x/PnRvJC8DekcPH2Gd+RLTgI=;
	b=ZQDcEIWcaVjpAIpN/8NZOgajhesTe2H2qTeykDbBqt8qcyreAgYQLi6PZPk+nHmlpkw5xN
	XN5Wux+B2z3IETFMOVH40YG5QwOKYBt4TYV7XTjqhL7Cd2qaMR7Sz278bwiGNf//Mqyb7a
	T40djBDM52UyWX3O9ZCYGlgKIWgYROk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-AvhrT0WlMlymLpLHRP4UUw-1; Thu, 16 Sep 2021 11:09:06 -0400
X-MC-Unique: AvhrT0WlMlymLpLHRP4UUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7D2C801B3D;
	Thu, 16 Sep 2021 15:09:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DADAC60C82;
	Thu, 16 Sep 2021 15:08:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48BC31800FE4;
	Thu, 16 Sep 2021 15:08:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GF8eNe029071 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 11:08:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 500255D6D5; Thu, 16 Sep 2021 15:08:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B401269322;
	Thu, 16 Sep 2021 15:08:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18GF8chf012082; 
	Thu, 16 Sep 2021 10:08:38 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18GF8bIR012081;
	Thu, 16 Sep 2021 10:08:37 -0500
Date: Thu, 16 Sep 2021 10:08:37 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210916150837.GY3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-33-mwilck@suse.com>
	<20210916041734.GR3087@octiron.msp.redhat.com>
	<d7440ecaf519e509540cd1b1c32157bd8e980dd5.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <d7440ecaf519e509540cd1b1c32157bd8e980dd5.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 32/35] multipathd: uxlsnr: add timeout
	handling
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

On Thu, Sep 16, 2021 at 10:58:36AM +0200, Martin Wilck wrote:
> On Wed, 2021-09-15 at 23:17 -0500, Benjamin Marzinski wrote:
> > On Fri, Sep 10, 2021 at 01:41:17PM +0200, mwilck@suse.com=A0wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > >=20
> > > Our ppoll() call needs to wake up when a client request times out.
> > > This logic can be added by determining the first client that's
> > > about
> > > to time out. The logic in handle_client() will then cause a timeout
> > > reply to be sent to the client. This is more client-friendly
> > > as the client timing out without receiving a reply.
> > >=20
> > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > ---
> > > =A0multipathd/uxlsnr.c | 58
> > > +++++++++++++++++++++++++++++++++++++++++----
> > > =A01 file changed, 53 insertions(+), 5 deletions(-)
> > >=20
> > > =A0
> > > @@ -594,6 +643,7 @@ void *uxsock_listen(long ux_sock, void
> > > *trigger_data)
> > > =A0=A0=A0=A0=A0=A0=A0=A0while (1) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct client *c, *tm=
p;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int i, n_pfds, poll_c=
ount, num_clients;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct timespec __timeo=
ut, *timeout;
> >=20
> > Maybe it's just too late to be looking at code, but I'm missing why
> > we
> > need a separate variable that it a pointer to __timeout.
>=20
> This way __get_soonest_timeout() can return either NULL or &__timeout,
> and we can simply pass the return value to ppoll().

Ah. Yep. Too late to be reviewing code.

-Ben

>=20
> Martin
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

