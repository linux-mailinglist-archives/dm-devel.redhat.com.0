Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8186C1479CC
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jan 2020 09:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579856209;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post:autocrypt:autocrypt;
	bh=uPe/0Ah5dvfX5X6tIvzNDmsl4+IoglymWSdPUWFEJvY=;
	b=ZO5ssmhzu+43XeviM1LW7K1BA6qHsvvc6LmacNUW9TZuAaeu0w6ZJjZJ9DmEPZEQnPHxTo
	TpNXt6Zs6bq04TG9gyJ0SqlIrAONRX8wraxcoPfRftEoQMVW0TGXsXy8gtvU4F7RlOdaR2
	up5htNMGGw5u1pE8eqDxEW2meSxJwbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-ZslKiN_AN7CTpQWPvufA1Q-1; Fri, 24 Jan 2020 03:56:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CEE2800D53;
	Fri, 24 Jan 2020 08:56:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF84B60BF3;
	Fri, 24 Jan 2020 08:56:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBCD48594F;
	Fri, 24 Jan 2020 08:56:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00O64TpB006569 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 01:04:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E8C32166B2F; Fri, 24 Jan 2020 06:04:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A1B12166B28
	for <dm-devel@redhat.com>; Fri, 24 Jan 2020 06:04:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB29A80285C
	for <dm-devel@redhat.com>; Fri, 24 Jan 2020 06:04:27 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1579845867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TRZth3YKsGSzkiLSCnJkbh8hRaW5CrubB/2XV409lSE=;
	b=jCAhS0h5+K48uhxZM+OfSTG87Ka3e2UZScIimBpvxwow02AQs7HE5wTW/yeQEpERYfYPfT
	cnJUUBwaqV2BYKCzZnnrTMYQsBPHsdU6o7ccajvrAgwXK9KeN+9gmr3hF60IuqadRACe36
	ArKfvp+6nAnRz557MaDF0drTParukKvUUFDVSEKZ3XL31RUHwWVgcMMKxQaPBpmBX+Yz6+
	3CQq81gN2/ZWzV/HJKbfNcJQ7cFnyUtONpjL9ovaiQWyiGRSN51iAbaumtJNx1hJOt+KgC
	bbGJHbSTlxwaUQJ9ZB11CwSEz03QGXWl/C5aXnZoOLWtJ7tteCYpuOV8fE7V5w==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1579845867; a=rsa-sha256;
	cv=none;
	b=ITEUTN8S2+wVF3GG2i9ysTjyK8Q7OYIgy/6q7A6BsY55EYNm16tKdH3xkxk7C/FNf2wib5
	J6ahG5XZS8CqLAeJTXuRFhQMURyeUD8hoLa9NT5x2F8tTX08+RHHihWby9GUInUijMSAhj
	f2pFNMBfZ6rS5WBcLSvng6Txz5TESt5a29QF7RyPgPw65TGGmyp/zVwkFuAcW5i6Qk22kd
	AeO7I87LFshAiI/oSwqIIv1dhbQyKPur0RtuZaRo8gWIW1jBo9vzotE3s0990W4Dnl3eZV
	DwrXlaIyTsuLOuMvUYwgv3wevcs3EmwHegTF4EzN/JDrDilqdt5Lv1RKTAU/zw==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	spf=none (relay.mimecast.com: domain of stefan.bader@canonical.com has
	no SPF policy when checking 91.189.89.112)
	smtp.mailfrom=stefan.bader@canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-1m7ULrlnMza3LQlpEmgC_w-1; Fri, 24 Jan 2020 01:04:23 -0500
X-MC-Unique: 1m7ULrlnMza3LQlpEmgC_w-1
X-MC-Unique: ZslKiN_AN7CTpQWPvufA1Q-1
Received: from [154.119.55.242] (helo=[10.155.147.178])
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <stefan.bader@canonical.com>)
	id 1ius4r-0007SG-I0; Fri, 24 Jan 2020 06:04:21 +0000
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
	<20200123103541.GA28102@redhat.com> <20200123172816.GA31063@redhat.com>
	<81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
From: Stefan Bader <stefan.bader@canonical.com>
Autocrypt: addr=stefan.bader@canonical.com; prefer-encrypt=mutual; keydata=
	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
	2Iat+yfjuNhlNAJs
Message-ID: <c733639c-421d-19af-81fd-61d7b2ad019e@canonical.com>
Date: Fri, 24 Jan 2020 08:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 Jan 2020 03:55:56 -0500
Cc: linux-block@vger.kernel.org, Tyler Hicks <tyler.hicks@canonical.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] blk/core: Gracefully handle unset
	make_request_fn
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
Content-Type: multipart/mixed; boundary="===============0611492873135260198=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0611492873135260198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="zTLhkZGxdCktEkSjLInMVv7empLOhgroL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zTLhkZGxdCktEkSjLInMVv7empLOhgroL
Content-Type: multipart/mixed; boundary="YFDhP2D9xiAic0tOcuyovTHE0VS66F84F"

--YFDhP2D9xiAic0tOcuyovTHE0VS66F84F
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 23.01.20 20:52, Jens Axboe wrote:
> On 1/23/20 10:28 AM, Mike Snitzer wrote:
>> On Thu, Jan 23 2020 at  5:35am -0500,
>> Mike Snitzer <snitzer@redhat.com> wrote:
>>
>>> On Thu, Jan 23 2020 at  4:17am -0500,
>>> Stefan Bader <stefan.bader@canonical.com> wrote:
>>>
>>>> When device-mapper adapted for multi-queue functionality, they
>>>> also re-organized the way the make-request function was set.
>>>> Before, this happened when the device-mapper logical device was
>>>> created. Now it is done once the mapping table gets loaded the
>>>> first time (this also decides whether the block device is request
>>>> or bio based).
>>>>
>>>> However in generic_make_request(), the request function gets used
>>>> without further checks and this happens if one tries to mount such
>>>> a partially set up device.
>>>>
>>>> This can easily be reproduced with the following steps:
>>>>  - dmsetup create -n test
>>>>  - mount /dev/dm-<#> /mnt
>>>>
>>>> This maybe is something which also should be fixed up in device-
>>>> mapper.
>>>
>>> I'll look closer at other options.
>>>
>>>> But given there is already a check for an unset queue
>>>> pointer and potentially there could be other drivers which do or
>>>> might do the same, it sounds like a good move to add another check
>>>> to generic_make_request_checks() and to bail out if the request
>>>> function has not been set, yet.
>>>>
>>>> BugLink: https://bugs.launchpad.net/bugs/1860231
>>>
>>> >From that bug;
>>> "The currently proposed fix introduces no chance of stability
>>> regressions. There is a chance of a very small performance regression
>>> since an additional pointer comparison is performed on each block layer
>>> request but this is unlikely to be noticeable."
>>>
>>> This captures my immediate concern: slowing down everyone for this DM
>>> edge-case isn't desirable.
>>
>> SO I had a look and there isn't anything easier than adding the proposed
>> NULL check in generic_make_request_checks().  Given the many
>> conditionals in that  function.. what's one more? ;)
>>
>> I looked at marking the queue frozen to prevent IO via
>> blk_queue_enter()'s existing cheeck -- but that quickly felt like an
>> abuse, especially in that there isn't a queue unfreeze for bio-based.
>>
>> Jens, I'll defer to you to judge this patch further.  If you're OK with
>> it: cool.  If not, I'm open to suggestions for how to proceed. =20
>>
>=20
> It does kinda suck... The generic_make_request_checks() is a mess, and
> this doesn't make it any better. Any reason why we can't solve this
> two step setup in a clean fashion instead of patching around it like
> this? Feels like a pretty bad hack, tbh.
>=20

Tyler spent some time thinking about delaying the allocation of the queue
structure until later but that seemed rather dangerous. IIRC there are plac=
es
during registration of the (generic) block device which expect this to be d=
one.

Not sure whether it would be feasible to start with one kind of dummy
make_request_fn and then switch that over to the proper one once that decis=
ion
can be made...


--YFDhP2D9xiAic0tOcuyovTHE0VS66F84F--

--zTLhkZGxdCktEkSjLInMVv7empLOhgroL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE2118yvOZTjOV2k0+6Gdd7svuzqMFAl4qiNcACgkQ6Gdd7svu
zqMScQ//Vf/z7PoK3uToouYs/S2bQ0nQ0P3kOSlp5L81Oo5rhIEn/6c6mkCbc/NI
dvgPAllLo7IeYSnR1Ha8NYvnJXSVl7e/AW0bH/CHJVhDO/fe5RRbGQUANc8ykK8K
ovTKsi88/0eoQGXajgKXxr+mnO21U+RHYzMl9x472l6gr+sSZ1aLWE8qvo4jvVPu
iNKXnVw37I7VLv6eMauBMBZGnlSwfmJfdyEq2v5SeljQSWRSk7h+Y3WOKEvFhRWa
ehmlz4Xb/mQhxURQyCsvn0rUn2EDF8OrdGdkY79ddD2h9A7YuUqd12YmbZF9xe36
f7ndEWW9TZsa6eIjuVMkzVHALMfPVwUynOKrBiChtMLzdXkF84rAy1jutWF2KP+M
ZrngByxOqheaHweUeExo9BNPne5hEID+aInEVDgm2zmoagHDzOsHAmc0H8PLwQx1
0vmHUGAzAZbs4BesoV2rdAhM9SSGpx8oVUys3hZj6KKBvRyXEQO64X9KZmpjpoWt
+qhcT5593Dodl/Vgawpc5AnXMq6sFJg+R5V6kcY+ac6H12p8mtS4nnREKjtq/li1
lNSju1n1cjqTBrJPyVZTYzdhHPY6NIAbkg8CVFUd9DYQ3HmPj4ftz8mTTjF72XjU
70vNsGCvEYMMjC1doXBuRj/DPjiA6i/Z6EYRcZw9iPWkyzuWO6E=
=h/Df
-----END PGP SIGNATURE-----

--zTLhkZGxdCktEkSjLInMVv7empLOhgroL--


--===============0611492873135260198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0611492873135260198==--

