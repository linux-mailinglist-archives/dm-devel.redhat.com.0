Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0500114C9B1
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jan 2020 12:34:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580297650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post:autocrypt:autocrypt;
	bh=pLUmxRlK5yDerwVy2lgSig36NYmahGEtY3Qa7jZs/p8=;
	b=DdThyS94Av5dRVLYlPNbKX6tzHwBP59epzWCPB9FbJzeD/OrSSzgvm2sCKQtMjAorIneME
	U57tl8GiXj+uAEMsEKxf8ItUoMux28k6IlYpnHo9UULE6VtZIF4fvDhdGLAh8X++YwCMz/
	EMcMGj7A6pRhY00hqvcLanV8lYrQRzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-KL0E7161PBGMRASojiwncw-1; Wed, 29 Jan 2020 06:34:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09DC1107ACC9;
	Wed, 29 Jan 2020 11:34:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97D9B1001920;
	Wed, 29 Jan 2020 11:33:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52EEC87A7F;
	Wed, 29 Jan 2020 11:33:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00SEWYWT022460 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jan 2020 09:32:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D768B10C7326; Tue, 28 Jan 2020 14:32:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1C6D10CB289
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 14:32:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 861FB801E91
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 14:32:30 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1580221950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9JTNJX1Ae4M/RpQHJjKh/xxj/snGLNKqr4k1hGzfzW8=;
	b=nabjjad3igXy2zfvtglXUIOW9unfFdu7wkF6owM3V6lSCcn4+b/ZIMlFSsfasLYH4teJ87
	rwnEe/GsT4vkr0Ft1186SVw/0bOv2lgGwecUZpwz8XHMW5Ze22v3Q+dC6Q6kPLBRw0kyn6
	eT1EBZKDfW79pF4wo6ptF76IRvJ637Mtz5lY8GRJXMCmTR7ET8iONCKW2jxYS5doKfXpJg
	cApIApwv3OAaMDQuaNIvV6Bj6CRQ2PpGXBcWCMRZ+jMplDwWT9+o8b2M6VZ3SE1sd8hVGf
	dc9TnyvK8v+sf4oeU0Hu1Yje0bFUK3pr+SOUqyWTxHCyNoQAlgTru4LaWvNZgQ==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1580221950; a=rsa-sha256;
	cv=none;
	b=BrgljzX7ta3shmJ89Mc/cEUXZUCAc/N9eJXPPEmHyPv+VoV/C2Xlj90t5adUpDGLSSGKpm
	iO9hrzL1V1AhXiJSd/n8gAeKhoXJTo2i9VDarNj6LUIlfIpXSpZWeE2D9qNrTXfW+KI9Cw
	sptTefy/+pY0clvdNQQzGViqOLj79bEpiOib434YC4LTnzOr/uLCXY4FTlm/Me4eSTFp6Z
	fgZiwMIp5NgqMdka0XfHXB+t98uQqzod13Kx0thk97EYVfVbi+uzKaDRnpuFPjtUh9ke2w
	WSDjiaA740PCJrzJUW96X29ZCL0mRYNv5dSjkaD4orNL+7rxg3a7Up3VpEt8tw==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	spf=none (relay.mimecast.com: domain of stefan.bader@canonical.com has
	no SPF policy when checking 91.189.89.112)
	smtp.mailfrom=stefan.bader@canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-107-x1nKDupbNSKfuVp1aL2dWQ-1; Tue, 28 Jan 2020 09:32:23 -0500
X-MC-Unique: x1nKDupbNSKfuVp1aL2dWQ-1
X-MC-Unique: KL0E7161PBGMRASojiwncw-1
Received: from 1.general.smb.uk.vpn ([10.172.193.28])
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <stefan.bader@canonical.com>)
	id 1iwRuf-0000U8-Nr; Tue, 28 Jan 2020 14:32:21 +0000
To: Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
	<20200123103541.GA28102@redhat.com> <20200123172816.GA31063@redhat.com>
	<81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
	<20200127193225.GA5065@redhat.com>
From: Stefan Bader <stefan.bader@canonical.com>
Autocrypt: addr=stefan.bader@canonical.com; prefer-encrypt=mutual; keydata=
	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
	2Iat+yfjuNhlNAJs
Message-ID: <e0475dae-a55f-f30e-a82f-ee35cdb171c4@canonical.com>
Date: Tue, 28 Jan 2020 15:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127193225.GA5065@redhat.com>
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 29 Jan 2020 06:33:33 -0500
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
Content-Type: multipart/mixed; boundary="===============2773296163980809829=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2773296163980809829==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="QoMqDKtowBAHCBPOeuuP2rKfGv2dipUh6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QoMqDKtowBAHCBPOeuuP2rKfGv2dipUh6
Content-Type: multipart/mixed; boundary="HBI1GOJsjgBEKnldT5vqQi19oKb4RQWqA"

--HBI1GOJsjgBEKnldT5vqQi19oKb4RQWqA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 27.01.20 20:32, Mike Snitzer wrote:
> On Thu, Jan 23 2020 at  1:52pm -0500,
> Jens Axboe <axboe@kernel.dk> wrote:
>=20
>> On 1/23/20 10:28 AM, Mike Snitzer wrote:
>>> On Thu, Jan 23 2020 at  5:35am -0500,
>>> Mike Snitzer <snitzer@redhat.com> wrote:
>>>
>>>> On Thu, Jan 23 2020 at  4:17am -0500,
>>>> Stefan Bader <stefan.bader@canonical.com> wrote:
>>>>
>>>>> When device-mapper adapted for multi-queue functionality, they
>>>>> also re-organized the way the make-request function was set.
>>>>> Before, this happened when the device-mapper logical device was
>>>>> created. Now it is done once the mapping table gets loaded the
>>>>> first time (this also decides whether the block device is request
>>>>> or bio based).
>>>>>
>>>>> However in generic_make_request(), the request function gets used
>>>>> without further checks and this happens if one tries to mount such
>>>>> a partially set up device.
>>>>>
>>>>> This can easily be reproduced with the following steps:
>>>>>  - dmsetup create -n test
>>>>>  - mount /dev/dm-<#> /mnt
>>>>>
>>>>> This maybe is something which also should be fixed up in device-
>>>>> mapper.
>>>>
>>>> I'll look closer at other options.
>>>>
>>>>> But given there is already a check for an unset queue
>>>>> pointer and potentially there could be other drivers which do or
>>>>> might do the same, it sounds like a good move to add another check
>>>>> to generic_make_request_checks() and to bail out if the request
>>>>> function has not been set, yet.
>>>>>
>>>>> BugLink: https://bugs.launchpad.net/bugs/1860231
>>>>
>>>> >From that bug;
>>>> "The currently proposed fix introduces no chance of stability
>>>> regressions. There is a chance of a very small performance regression
>>>> since an additional pointer comparison is performed on each block laye=
r
>>>> request but this is unlikely to be noticeable."
>>>>
>>>> This captures my immediate concern: slowing down everyone for this DM
>>>> edge-case isn't desirable.
>>>
>>> SO I had a look and there isn't anything easier than adding the propose=
d
>>> NULL check in generic_make_request_checks().  Given the many
>>> conditionals in that  function.. what's one more? ;)
>>>
>>> I looked at marking the queue frozen to prevent IO via
>>> blk_queue_enter()'s existing cheeck -- but that quickly felt like an
>>> abuse, especially in that there isn't a queue unfreeze for bio-based.
>>>
>>> Jens, I'll defer to you to judge this patch further.  If you're OK with
>>> it: cool.  If not, I'm open to suggestions for how to proceed. =20
>>>
>>
>> It does kinda suck... The generic_make_request_checks() is a mess, and
>> this doesn't make it any better. Any reason why we can't solve this
>> two step setup in a clean fashion instead of patching around it like
>> this? Feels like a pretty bad hack, tbh.
>=20
> I just staged the following DM fix:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.gi=
t/commit/?h=3Ddm-5.6&id=3D28a101d6b344f5a38d482a686d18b1205bc92333

Thanks Mike,

yeah this looks like it resolves the problem without adding any impact on t=
he
generic I/O path. We certainly had thought about that but felt uncertain wh=
ether
it would not open other risks. Like something adding requests just before t=
he
table load. Could this cause some I/O be handled by one function and the re=
st by
another? And would that really matter?

The other thing that was a bit strange but maybe someone else's problem is =
that
mount generated I/O requests to start with. The device size should be 0 sti=
ll.


>=20
> From: Mike Snitzer <snitzer@redhat.com>
> Date: Mon, 27 Jan 2020 14:07:23 -0500
> Subject: [PATCH] dm: fix potential for q->make_request_fn NULL pointer
>=20
> Move blk_queue_make_request() to dm.c:alloc_dev() so that
> q->make_request_fn is never NULL during the lifetime of a DM device
> (even one that is created without a DM table).
>=20
> Otherwise generic_make_request() will crash simply by doing:
>   dmsetup create -n test
>   mount /dev/dm-N /mnt
>=20
> While at it, move ->congested_data initialization out of
> dm.c:alloc_dev() and into the bio-based specific init method.
>=20
> Reported-by: Stefan Bader <stefan.bader@canonical.com>
> BugLink: https://bugs.launchpad.net/bugs/1860231
> Fixes: ff36ab34583a ("dm: remove request-based logic from make_request_fn=
 wrapper")
> Depends-on: c12c9a3c3860c ("dm: various cleanups to md->queue initializat=
ion code")
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  drivers/md/dm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index e8f9661a10a1..b89f07ee2eff 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1859,6 +1859,7 @@ static void dm_init_normal_md_queue(struct mapped_d=
evice *md)
>  =09/*
>  =09 * Initialize aspects of queue that aren't relevant for blk-mq
>  =09 */
> +=09md->queue->backing_dev_info->congested_data =3D md;
>  =09md->queue->backing_dev_info->congested_fn =3D dm_any_congested;
>  }
> =20
> @@ -1949,7 +1950,12 @@ static struct mapped_device *alloc_dev(int minor)
>  =09if (!md->queue)
>  =09=09goto bad;
>  =09md->queue->queuedata =3D md;
> -=09md->queue->backing_dev_info->congested_data =3D md;
> +=09/*
> +=09 * default to bio-based required ->make_request_fn until DM
> +=09 * table is loaded and md->type established. If request-based
> +=09 * table is loaded: blk-mq will override accordingly.
> +=09 */
> +=09blk_queue_make_request(md->queue, dm_make_request);
> =20
>  =09md->disk =3D alloc_disk_node(1, md->numa_node_id);
>  =09if (!md->disk)
> @@ -2264,7 +2270,6 @@ int dm_setup_md_queue(struct mapped_device *md, str=
uct dm_table *t)
>  =09case DM_TYPE_DAX_BIO_BASED:
>  =09case DM_TYPE_NVME_BIO_BASED:
>  =09=09dm_init_normal_md_queue(md);
> -=09=09blk_queue_make_request(md->queue, dm_make_request);
>  =09=09break;
>  =09case DM_TYPE_NONE:
>  =09=09WARN_ON_ONCE(true);
>=20



--HBI1GOJsjgBEKnldT5vqQi19oKb4RQWqA--

--QoMqDKtowBAHCBPOeuuP2rKfGv2dipUh6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE2118yvOZTjOV2k0+6Gdd7svuzqMFAl4wRe4ACgkQ6Gdd7svu
zqN2qw//bBrpllkwHJsA1CMT6kaPx5+mSENn7s/AIdQpsTMTTkP7rKPJQq5mx0yz
ZGG5yfJWZYitxNlnhMBIYfc0HzZJt69tZ8lBmfdloit3Uj4rdODY2VQqcqXGQ1zw
gBdaCAyP3pRCAYRKk7TERNGXO6+Q/xQP6neEbbnWT9AwGL80YfwlEZmP+WAPq3im
D5eCn4/zAv+4GTA13YBhNjozdm/I2+TSsjVhDhLaU780bIXMnyatB82yltYYEbSb
Hwo0OxqHw5nZdoO9VgK5m1rraHMCWKKhErm7GzUFyO8zFpSUsfhv7hVucbQgXIIF
Se89YPf+q2um1Yz77F1SkzVvLh3/rDRw3ACFSoAo1d22nXC02EfwASdvGw9OlJIz
+ffi0DVY9nUyaVXKz7f+C3FxwzldWMvNmrgoteLjNJ3jJ5Of0jBIq/nwxqTDVrny
oZ3el+F8VzUkuf5Nx8buYarX1ov1M1as/qlE9jlVGTzK63mgC9OOKEyn60+luUyf
hsZjQFrOncc3a8yhW82nyushl3pxdj93N55XdYEKHeikPTeLKd61TKKx0j0Pty2k
gT+ZiH3UjHLEZJAPbc94F6q3r1nh+q8KvUDRKjMbMz5B8IfZl9Cco3BxAYEpH/cf
mC+PnV1xFOMkwJZSwyLHl4bwf02sTMG+aPBVZiZyXqQNOGHr8XU=
=W0r0
-----END PGP SIGNATURE-----

--QoMqDKtowBAHCBPOeuuP2rKfGv2dipUh6--


--===============2773296163980809829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2773296163980809829==--

