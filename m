Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1B3C331239
	for <lists+dm-devel@lfdr.de>; Mon,  8 Mar 2021 16:32:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-VUpxaql3MqCDvoll_G_D0Q-1; Mon, 08 Mar 2021 10:32:03 -0500
X-MC-Unique: VUpxaql3MqCDvoll_G_D0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A42804331;
	Mon,  8 Mar 2021 15:31:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4EB19D9D;
	Mon,  8 Mar 2021 15:31:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28E3F1809C86;
	Mon,  8 Mar 2021 15:31:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128FVWW8013421 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 10:31:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B8AF2215671F; Mon,  8 Mar 2021 15:31:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B27A7215671E
	for <dm-devel@redhat.com>; Mon,  8 Mar 2021 15:31:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73D6885A5B9
	for <dm-devel@redhat.com>; Mon,  8 Mar 2021 15:31:30 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-207-T4MEOxbAPAqBsdPgGi-HVg-1;
	Mon, 08 Mar 2021 10:31:28 -0500
X-MC-Unique: T4MEOxbAPAqBsdPgGi-HVg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AA312ADDB;
	Mon,  8 Mar 2021 15:31:26 +0000 (UTC)
Message-ID: <717279ef3e16f19602633bd8ec4bc984afb59672.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Mon, 08 Mar 2021 16:31:25 +0100
In-Reply-To: <20210306153022.38449-1-xose.vazquez@gmail.com>
References: <20210306153022.38449-1-xose.vazquez@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 128FVWW8013421
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipath-tools: add more info about
 max_sectors_kb in multipath.conf.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-03-06 at 16:30 +0100, Xose Vazquez Perez wrote:
> Change of the default value in the kernel:
> =20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd2be537c3ba35
>=20
> To query the device:
> sg_inq -p 0xb0 /dev/sdX | grep "[ml] transfer length:"
>=20
>=20
> Note: some arrays does not report any value.
> =A0=A0=A0=A0=A0 3PAR: 65534 blocks
> =A0=A0=A0=A0=A0 RDAC: not reported
> =A0=A0=A0=A0=A0 Hitachi VSP: query error
>=20
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
> =A0multipath/multipath.conf.5 | 4 +++-
> =A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> index 8ef3a747..21963813 100644
> --- a/multipath/multipath.conf.5
> +++ b/multipath/multipath.conf.5
> @@ -1240,9 +1240,11 @@ The default is: \fB0\fR
> =A0.B max_sectors_kb
> =A0Sets the max_sectors_kb device parameter on all path devices and the
> multipath
> =A0device to the specified value.
> +If the storage device(array, hard disk, ...) does not export the
> value to the
> +system, the kernel sets it to 512(kernel < 4.3) or 1024(kernel >=3D
> 4.3).

I don't think this information belongs into the multipath.conf(5) man
page. We shouldn't start documenting changes of kernel defaults in this
man page, unless we intend to continue doing so and keep the
information up-to-date, and I don't think we can promise that. Also,
the kernel major/minor number information may easily be wrong for
distribution kernels that have backported the respective change. Kernel
behavior should be documented in the kernel documentation as provided
by the distribution.

The way the kernel handles max_sectors and max_hw_sectors is actually
pretty complex, and I wouldn't even attempt to try and explain it in
this man page.

That said, what's actually important for users to realize is the fact
that changes of max_sectors_kb don't propagate up the storage stack.
Once a DM device is first created, it will inherit the max_sectors_kb
value of the dm target(s). But if the value is changed for low-level
devices later, upper-level devices won't see the change. A typical
mistake is to run an udev rule decreasing max_sectors_kb for a SCSI
device after a multipath map has already been set up on that SCSI
device (e.g. in the initrd). The  multipath map will have a larger
max_sectors_kb value than the path device, and IO may actually fail for
that reason.

Thus it's generally recommended to use multipath.conf for applying
max_sectors_kb changes. If other devices (e.g. LVM) are stacked on top
of multipath, the same reasoning applies; therefore max_sectors_kb
shouldn't be changed at runtime without double-checking the entire
storage stack.

Regards,
Martin

> =A0.RS
> =A0.TP
> -The default is: \fB<device dependent>\fR
> +The default is: \fB<device dependent>\fR, or kernel provided if
> there is no value.




--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

