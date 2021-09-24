Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F1DE94171CD
	for <lists+dm-devel@lfdr.de>; Fri, 24 Sep 2021 14:27:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-e7iv-1hYNqSW9-ku2lgMFg-1; Fri, 24 Sep 2021 08:27:51 -0400
X-MC-Unique: e7iv-1hYNqSW9-ku2lgMFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6376F1019988;
	Fri, 24 Sep 2021 12:27:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3099F2AF99;
	Fri, 24 Sep 2021 12:27:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AE971803B30;
	Fri, 24 Sep 2021 12:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18OCR7lO010862 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Sep 2021 08:27:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1C6F11701D3; Fri, 24 Sep 2021 12:27:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB9810BC2B7
	for <dm-devel@redhat.com>; Fri, 24 Sep 2021 12:27:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59488811E7A
	for <dm-devel@redhat.com>; Fri, 24 Sep 2021 12:27:04 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-218-Dy_-Ez5GOWKXIpdRSgV-nw-1; Fri, 24 Sep 2021 08:27:02 -0400
X-MC-Unique: Dy_-Ez5GOWKXIpdRSgV-nw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64F3D1FFEE;
	Fri, 24 Sep 2021 12:27:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 321E213B67;
	Fri, 24 Sep 2021 12:27:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id 1Vq0CRXETWHPDgAAMHmgww
	(envelope-from <mwilck@suse.com>); Fri, 24 Sep 2021 12:27:01 +0000
Message-ID: <cd2850ea37f4ea880717aab621d0c7a181e4c351.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Luca BRUNO <luca.bruno@coreos.com>, dm-devel@redhat.com
Date: Fri, 24 Sep 2021 14:27:00 +0200
In-Reply-To: <20210924093401.17852-1-luca.bruno@coreos.com>
References: <20210924093401.17852-1-luca.bruno@coreos.com>
User-Agent: Evolution 3.40.4
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18OCR7lO010862
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd.socket: add missing conditions
 from service unit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-09-24 at 09:34 +0000, Luca BRUNO wrote:
> This aligns 'multipathd' socket and service units, by adding the
> start conditions that are set on the service but not on the socket.
> It should help avoiding situations where the socket unit ends up
> marked as failed after hitting its retry-limit.
>=20
> Fixes: https://github.com/opensvc/multipath-tools/issues/15
> Signed-off-by: Luca BRUNO <luca.bruno@coreos.com>
> ---
> =A0multipathd/multipathd.socket | 3 +++
> =A01 file changed, 3 insertions(+)
>=20
> diff --git multipathd/multipathd.socket multipathd/multipathd.socket
> index 0ed4a1f7..c777e5e3 100644
> --- multipathd/multipathd.socket
> +++ multipathd/multipathd.socket
> @@ -1,6 +1,9 @@
> =A0[Unit]
> =A0Description=3Dmultipathd control socket
> =A0DefaultDependencies=3Dno
> +ConditionKernelCommandLine=3D!nompath
> +ConditionKernelCommandLine=3D!multipath=3Doff
> +ConditionVirtualization=3D!container
> =A0Before=3Dsockets.target
> =A0
> =A0[Socket]

Thanks!

I'll apply this to
https://github.com/openSUSE/multipath-tools/tree/queue

>From there it'll be submitted to the main repo.

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

