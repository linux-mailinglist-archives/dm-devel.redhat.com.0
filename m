Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1CB539E04D
	for <lists+dm-devel@lfdr.de>; Mon,  7 Jun 2021 17:27:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-bl6bkLX7NeWbQh394ftbhA-1; Mon, 07 Jun 2021 11:27:22 -0400
X-MC-Unique: bl6bkLX7NeWbQh394ftbhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 360541854E26;
	Mon,  7 Jun 2021 15:27:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 654545D6D5;
	Mon,  7 Jun 2021 15:27:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 394F01800BB4;
	Mon,  7 Jun 2021 15:27:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157FR0c6012357 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 11:27:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B51EF200AE73; Mon,  7 Jun 2021 15:27:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0FAE200D8CD
	for <dm-devel@redhat.com>; Mon,  7 Jun 2021 15:26:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB39101D221
	for <dm-devel@redhat.com>; Mon,  7 Jun 2021 15:26:57 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-368-7CsiZElOMlKEcNT5O5XNlg-1; Mon, 07 Jun 2021 11:26:55 -0400
X-MC-Unique: 7CsiZElOMlKEcNT5O5XNlg-1
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 36FF921A8A;
	Mon,  7 Jun 2021 15:26:54 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id 00865118DD;
	Mon,  7 Jun 2021 15:26:53 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
	id ecgtOr06vmAgbAAALh3uQQ
	(envelope-from <mwilck@suse.com>); Mon, 07 Jun 2021 15:26:53 +0000
Message-ID: <9a3af6f9cbb311e441a1f1709553094fe728e0a8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Utkarsh Gupta <utkarsh.gupta@canonical.com>, dm-devel@redhat.com
Date: Mon, 07 Jun 2021 17:26:53 +0200
In-Reply-To: <CADnr9J9-+cOtVQKxt+5QQ53efwvqfQZv6F0wdwWzMw+TZXN_tw@mail.gmail.com>
References: <CADnr9J9-+cOtVQKxt+5QQ53efwvqfQZv6F0wdwWzMw+TZXN_tw@mail.gmail.com>
User-Agent: Evolution 3.40.1
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157FR0c6012357
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: don't start in containers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mo, 2021-06-07 at 20:08 +0530, Utkarsh Gupta wrote:
> Do not attempt to start multipath-tools in containers,
> should switch for on-demand udev/socket based
> activation in the future.
>=20
> Originally reported as:
> https://bugs.launchpad.net/ubuntu/+source/multipath-tools/+bug/1823093
>=20
> Author: Dimitri John Ledkov <xnox@ubuntu.com>
> Co-Author: Utkarsh Gupta <utkarsh@debian.org>

Reviewed-by: Martin Wilck <mwilck@suse.com>

>=20
> ---
> =A0multipathd/multipathd.service | 1 +
> =A01 file changed, 1 insertion(+)
>=20
> --- a/multipathd/multipathd.service
> +++ b/multipathd/multipathd.service
> @@ -8,6 +8,7 @@ DefaultDependencies=3Dno
> =A0Conflicts=3Dshutdown.target
> =A0ConditionKernelCommandLine=3D!nompath
> =A0ConditionKernelCommandLine=3D!multipath=3Doff
> +ConditionVirtualization=3D!container
>=20
> =A0[Service]
> =A0Type=3Dnotify
>=20
>=20
> - u
>=20
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
>=20



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

