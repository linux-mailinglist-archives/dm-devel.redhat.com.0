Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8A721DCB
	for <lists+dm-devel@lfdr.de>; Mon,  5 Jun 2023 08:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685945056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DBD1tVTRdqKCEJc/yxeQHn3UJoumCnkcM/RnUuivnoA=;
	b=La3W9cVywXYe0gkpDO4iNLarqHHJoWrta90SftkNfLPXjXNxQeR9gRbToLaOYD35jyxNBH
	IgYMRO9kYpYrtCunD7hFEre0J9EsdqQ7d0K5B1UPaQ3ghAWYRjqTzAYmmAky46OoD08+Z0
	7fFObIaRZ2YquVvwLpcmtYwAoCgw8J4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-GAFe3Bp5OAGIef7JzLDkQw-1; Mon, 05 Jun 2023 02:04:13 -0400
X-MC-Unique: GAFe3Bp5OAGIef7JzLDkQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3C3138184E1;
	Mon,  5 Jun 2023 06:04:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1788482067;
	Mon,  5 Jun 2023 06:04:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4360E1946F2E;
	Mon,  5 Jun 2023 06:04:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 965681946595
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Jun 2023 03:16:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54DC02166B27; Mon,  5 Jun 2023 03:16:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7572166B25
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 03:16:50 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 355AA380673F
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 03:16:50 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-4WnvOGSoPxaRBWmfJmfF7w-1; Sun, 04 Jun 2023 23:16:46 -0400
X-MC-Unique: 4WnvOGSoPxaRBWmfJmfF7w-1
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-33b1e83e204so16647825ab.1; 
 Sun, 04 Jun 2023 20:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685935005; x=1688527005;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6RIp8/+2ROMbmgfodBV7gNklXelK6i7IpUS5pUrmgjw=;
 b=hddC6w38wMV3dA04eyYz8Xl4kSCg5yYnN8ycdOIU44yue1a47jm1elclLHGiH3Q4sA
 2FqdHsJcN/jT1b1VivKBGh7ivizYHzontXSMEhtj/XWpeQUe/TYgEEA7SFRygFB/PvMl
 dwgDzlGGrONqs1GjL8410dNEOhSNLMcvW50OTk/l3yMl2Va5GRo6GInekHCGeOoyqyhp
 onw36cTxOoLVgTtPG6uD5TVQvXsPgnucFgPFap/imxeTDVfiWnDeMG1pqhQ4SImnzNzQ
 QFOz72yo5NwlJZyGHQRDjWIRtEbnhiGACqBo8Xt1HgUpeDiUiMlvIMlnnA5g3o2LvEb6
 pvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685935005; x=1688527005;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RIp8/+2ROMbmgfodBV7gNklXelK6i7IpUS5pUrmgjw=;
 b=XXL/kblyVbz7vjlyt0vfiOJW3lIIzRxSmWR6HfeM9rgh4Db3rB6FqbFKhlgUNConCm
 Lpm2lxKlPIgLim+cQoADx/LQ47l+shPU+yiKASh/fJ+JnVXLbO0FmG95Iw2ynCJ5l53C
 I4n7WSXknTYJkM3lmOHusHLVEXC7ismm2KreAcNDtUHO3NqWDl9E5UkN+DTG7yL2/F/v
 g2PBBVxmpwf6hNnZquEgi6u4BQk0IcVKW0Ijfi+Si8z0KbdGmWNcE4swrJG+ueU0wEGD
 rCHaJtaZX7Ef+Iq9XTp+myBFQeu/ZVKMkM0lufF8E8IYK8qCO9CJn8bwdsJ0q3GhtNm7
 7z6g==
X-Gm-Message-State: AC+VfDwR4KSPvHUPQUNDRnG76I4jZgxxpqudGPK/S2PhwBUH1rF0igUR
 QfHB+VC9Q5It6wq7kdyi1Fg=
X-Google-Smtp-Source: ACHHUZ5gh6OL2VL0ttW0+wx8rwFffRN+NKM156RLHk3uSO0deVArqH2NJxZgrS9IZCecilcQ9u4fqA==
X-Received: by 2002:a92:cd49:0:b0:331:35c2:d242 with SMTP id
 v9-20020a92cd49000000b0033135c2d242mr15938042ilq.32.1685935005445; 
 Sun, 04 Jun 2023 20:16:45 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-4.three.co.id. [180.214.233.4])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a62b502000000b0064c98c87384sm4178939pfe.44.2023.06.04.20.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 20:16:44 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 81FDE106291; Mon,  5 Jun 2023 10:16:42 +0700 (WIB)
Date: Mon, 5 Jun 2023 10:16:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Russell Harmon <eatnumber1@gmail.com>
Message-ID: <ZH1TmkyVJbIlNUEE@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-4-eatnumber1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230604190604.4800-4-eatnumber1@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 05 Jun 2023 06:04:03 +0000
Subject: Re: [dm-devel] [PATCH v3 3/4] Document dm-integrity default values.
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, mpatocka@redhat.com, snitzer@redhat.com,
 linux-doc@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============8849797757800652899=="
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9


--===============8849797757800652899==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uv1ofh8JTa3EH3uz"
Content-Disposition: inline


--Uv1ofh8JTa3EH3uz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 12:06:03PM -0700, Russell Harmon wrote:
> Specifically:
>   interleave_sectors =3D 32768
>   buffer_sectors =3D 128
>   block_size =3D 512
>   journal_watermark =3D 50
>   commit_time =3D 10000

Your patch description duplicates the diff content below. Please write
in a mood that evocates curiosity to read the diff (and make sure it is
also imperative).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Uv1ofh8JTa3EH3uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH1TmgAKCRD2uYlJVVFO
oxtOAQDxw0K4WAzLOQJeDgTZ7eKZGmfQHtK8yGKMib5ms10aBQD+N1pKF9YxeXZM
z6jjsj1Q7fsfCkCdevSHNeih/7UssAo=
=/mJ5
-----END PGP SIGNATURE-----

--Uv1ofh8JTa3EH3uz--


--===============8849797757800652899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============8849797757800652899==--

