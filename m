Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC31728F731
	for <lists+dm-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602780792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s8kJGhWxlH/7UihaH9l3IrHqlOCpByU2aK5PCYQVS+w=;
	b=L0I7qfPmL3zwiZHkUh9lABQqBbkbFOYKgPRKe4l8K9coZxLvo97g2jUc7bkD4xQ4jKBYQ6
	4JFpPj5aAAKlUQd6uTrehZBvam+csrK3pNJo/srBlvIIY4m/VWx9y97bYCGkGFb+75x6nz
	pdsv20L0ufGXJHz2pVTKV4ffYXycs0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-EJ19gil5O_qWxnQt1dveCw-1; Thu, 15 Oct 2020 12:53:09 -0400
X-MC-Unique: EJ19gil5O_qWxnQt1dveCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7350AF9A2;
	Thu, 15 Oct 2020 16:53:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31FA66EF54;
	Thu, 15 Oct 2020 16:52:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3C485810D;
	Thu, 15 Oct 2020 16:52:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09FGqY2j030706 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Oct 2020 12:52:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A94376672; Thu, 15 Oct 2020 16:52:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A51DD76649;
	Thu, 15 Oct 2020 16:52:30 +0000 (UTC)
Date: Thu, 15 Oct 2020 12:52:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Message-ID: <20201015165229.GA5513@redhat.com>
References: <20201015150504.1319098-1-mic@digikod.net>
MIME-Version: 1.0
In-Reply-To: <20201015150504.1319098-1-mic@digikod.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Deven Bowers <deven.desai@linux.microsoft.com>,
	linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>,
	Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: Re: [dm-devel] [PATCH v2] dm verity: Add support for signature
 verification with 2nd keyring
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15 2020 at 11:05am -0400,
Micka=EBl Sala=FCn <mic@digikod.net> wrote:

> From: Micka=EBl Sala=FCn <mic@linux.microsoft.com>
>=20
> Add a new configuration DM_VERITY_VERIFY_ROOTHASH_SIG_SECONDARY_KEYRING
> to enable dm-verity signatures to be verified against the secondary
> trusted keyring.  Instead of relying on the builtin trusted keyring
> (with hard-coded certificates), the second trusted keyring can include
> certificate authorities from the builtin trusted keyring and child
> certificates loaded at run time.  Using the secondary trusted keyring
> enables to use dm-verity disks (e.g. loop devices) signed by keys which
> did not exist at kernel build time, leveraging the certificate chain of
> trust model.  In practice, this makes it possible to update certificates
> without kernel update and reboot, aligning with module and kernel
> (kexec) signature verification which already use the secondary trusted
> keyring.
>=20
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Cc: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Milan Broz <gmazyland@gmail.com>
> Signed-off-by: Micka=EBl Sala=FCn <mic@linux.microsoft.com>
> ---
>=20
> Previous version:
> https://lore.kernel.org/lkml/20201002071802.535023-1-mic@digikod.net/
>=20
> Changes since v1:
> * Extend the commit message (asked by Jarkko Sakkinen).
> * Rename the Kconfig "help" keyword according to commit 84af7a6194e4
>   ("checkpatch: kconfig: prefer 'help' over '---help---'").

Can you please explain why you've decided to make this a Kconfig CONFIG
knob?  Why not either add: a dm-verity table argument? A dm-verity
kernel module parameter? or both (to allow a particular default but then
per-device override)?

Otherwise, _all_ DM verity devices will be configured to use secondary
keyring fallback.  Is that really desirable?

Regardless, I really don't see why a Kconfig knob is appropriate.

Mike


> ---
>  drivers/md/Kconfig                | 13 ++++++++++++-
>  drivers/md/dm-verity-verify-sig.c |  9 +++++++--
>  2 files changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index 30ba3573626c..1d68935e45ef 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -530,11 +530,22 @@ config DM_VERITY_VERIFY_ROOTHASH_SIG
>  =09bool "Verity data device root hash signature verification support"
>  =09depends on DM_VERITY
>  =09select SYSTEM_DATA_VERIFICATION
> -=09  help
> +=09help
>  =09  Add ability for dm-verity device to be validated if the
>  =09  pre-generated tree of cryptographic checksums passed has a pkcs#7
>  =09  signature file that can validate the roothash of the tree.
> =20
> +=09  By default, rely on the builtin trusted keyring.
> +
> +=09  If unsure, say N.
> +
> +config DM_VERITY_VERIFY_ROOTHASH_SIG_SECONDARY_KEYRING
> +=09bool "Verity data device root hash signature verification with second=
ary keyring"
> +=09depends on DM_VERITY_VERIFY_ROOTHASH_SIG
> +=09depends on SECONDARY_TRUSTED_KEYRING
> +=09help
> +=09  Rely on the secondary trusted keyring to verify dm-verity signature=
s.
> +
>  =09  If unsure, say N.
> =20
>  config DM_VERITY_FEC
> diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-ver=
ify-sig.c
> index 614e43db93aa..29385dc470d5 100644
> --- a/drivers/md/dm-verity-verify-sig.c
> +++ b/drivers/md/dm-verity-verify-sig.c
> @@ -119,8 +119,13 @@ int verity_verify_root_hash(const void *root_hash, s=
ize_t root_hash_len,
>  =09}
> =20
>  =09ret =3D verify_pkcs7_signature(root_hash, root_hash_len, sig_data,
> -=09=09=09=09sig_len, NULL, VERIFYING_UNSPECIFIED_SIGNATURE,
> -=09=09=09=09NULL, NULL);
> +=09=09=09=09sig_len,
> +#ifdef CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_SECONDARY_KEYRING
> +=09=09=09=09VERIFY_USE_SECONDARY_KEYRING,
> +#else
> +=09=09=09=09NULL,
> +#endif
> +=09=09=09=09VERIFYING_UNSPECIFIED_SIGNATURE, NULL, NULL);
> =20
>  =09return ret;
>  }
>=20
> base-commit: bbf5c979011a099af5dc76498918ed7df445635b
> --=20
> 2.28.0
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

