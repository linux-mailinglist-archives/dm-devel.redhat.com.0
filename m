Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B80408626E
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 14:58:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF8FD30A00C7;
	Thu,  8 Aug 2019 12:57:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9619F60A97;
	Thu,  8 Aug 2019 12:57:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 873D918005A4;
	Thu,  8 Aug 2019 12:57:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78CtJej032026 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 08:55:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8FFF61559; Thu,  8 Aug 2019 12:55:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0AF85EE1D
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 12:55:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5475ED24C
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1565268886;
	bh=fERL+VbmO4jwbI9sAaNParN2L49X6EjaF01lw6I8iSk=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Zp77Wbx+8ErKPz2sSFwaJswUivYfL7Klh3zKYDksABLzhFtC7XhUcTWbGLbzX99sz
	9uvHvVULgOmHsJSFATZmQsZF/WQwImFdKvbyFZtkJ3sp38FqniUo7s1qMJnPLbS73W
	nVE3f3Ga3Zjj9GR0FPFJD8rN19W+9zXUMDIfdJKU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([54.250.245.166]) by mail.gmx.com (mrgmx002
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0MC4VE-1i4Xe13B0C-008tGC;
	Thu, 08 Aug 2019 14:54:46 +0200
To: Qu Wenruo <wqu@suse.com>, dm-devel@redhat.com
References: <20190619080312.11549-1-wqu@suse.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quwenruo.btrfs@gmx.com; prefer-encrypt=mutual; keydata=
	mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
	8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
	1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
	9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
	gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
	AAG0IlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT6JAVQEEwEIAD4CGwMFCwkI
	BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCWdWCnQUJCWYC
	bgAKCRDCPZHzoSX+qAR8B/94VAsSNygx1C6dhb1u1Wp1Jr/lfO7QIOK/nf1PF0VpYjTQ2au8
	ihf/RApTna31sVjBx3jzlmpy+lDoPdXwbI3Czx1PwDbdhAAjdRbvBmwM6cUWyqD+zjVm4RTG
	rFTPi3E7828YJ71Vpda2qghOYdnC45xCcjmHh8FwReLzsV2A6FtXsvd87bq6Iw2axOHVUax2
	FGSbardMsHrya1dC2jF2R6n0uxaIc1bWGweYsq0LXvLcvjWH+zDgzYCUB0cfb+6Ib/ipSCYp
	3i8BevMsTs62MOBmKz7til6Zdz0kkqDdSNOq8LgWGLOwUTqBh71+lqN2XBpTDu1eLZaNbxSI
	ilaVuQENBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
	CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
	/IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
	GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
	q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
	ABEBAAGJATwEGAEIACYWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCWdWBrwIbDAUJA8JnAAAK
	CRDCPZHzoSX+qA3xB/4zS8zYh3Cbm3FllKz7+RKBw/ETBibFSKedQkbJzRlZhBc+XRwF61mi
	f0SXSdqKMbM1a98fEg8H5kV6GTo62BzvynVrf/FyT+zWbIVEuuZttMk2gWLIvbmWNyrQnzPl
	mnjK4AEvZGIt1pk+3+N/CMEfAZH5Aqnp0PaoytRZ/1vtMXNgMxlfNnb96giC3KMR6U0E+siA
	4V7biIoyNoaN33t8m5FwEwd2FQDG9dAXWhG13zcm9gnk63BN3wyCQR+X5+jsfBaS4dvNzvQv
	h8Uq/YGjCoV1ofKYh3WKMY8avjq25nlrhzD/Nto9jHp8niwr21K//pXVA81R2qaXqGbql+zo
Message-ID: <256f2ccc-af5b-e30a-76c1-a911f242d252@gmx.com>
Date: Thu, 8 Aug 2019 20:54:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190619080312.11549-1-wqu@suse.com>
X-Provags-ID: V03:K1:J0JYvJ/y6V7aDcVKeja9jwhS0OoVTKxTCs/3v0lSEWbMwOzPrXu
	mO+6bv+FeCUkfcBnlmGjh38XwQWbCQGu025Vxr3nGHNDkR1yW/KvuZmeWi824DvYk1WpcVr
	2bD1ry/JMvLMN7sMpwJfA9KTPahQ/CorzKGwVza/4XgfkLt/FkPPWpXZETOHz03IdH1FW4k
	ji/DnyvvJEv1IAo4jHICg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QbsdOYeW9CE=:WnfLLt0gLahOxCiVvhahp+
	s3Fc2ZOMIMA5uf/CQmxyzMVB2eQxc1x5OI6r65J37DvFwFcV3g+RCzXFHAt3UUQG3HNfIBJdH
	Vf/F0OHRjhbCu3On0UauGufYUsCW9sltNaQ5bJbBesCZODNkBT/+OVdWVCe9WcIMNM7m9LgDo
	4hpdfP5yLaPGpxXjprqPQHIXzNcrWKImsNe9sKiKrNsOadArSHerS02kCPfXZLZtVRCWIyvlJ
	xRhMi8zZ5dAHEaZbKaSnmNncZsMohx0uM4t17HNR76hPPp2g+kLLrsO+Gig3z5+TsxQOp1Ngf
	ISJUofFpTUaLW14w83xHtB9HiHK5iNIoQ5EtRL4EQU+iZ3Y10hVAxID77Bq5Ec/4k/70o5Nr6
	3VEw3gzCJ/xLAS2WwZqoV1YKZuCNjpmMsUGZzuCMENEfZMX4Ld4sSROHiiORXbGxxYLYrhP0t
	kON3tmUPV/WU7W0XNDL7lC2/voaY96ZrXTa5oUWxVYtrfkFTLCTOTFJO3auWzyx4RKdssnW6M
	LJ9t5eGcszIPjrU8LNg+K5JU5MTuO22vMsp1xENs2AR0JVdJ0AUSvLAobMW1M5FoWw7MeX0ya
	x7H0lXrgwGLxey3rf76ZjaMpCmM+FQrSu1tKBaSPsd1tojFy69lAUC2rmRx/HD8FrECIzn8zC
	V1bXvlOMudKUmdEa26O+4BYvCK+ICYmjBpuNg8+LN9NyByUTr5jJ86jtOxxqH+Btj9B0BMc8W
	uJcs+19qojtrCxzgTe0Oi1yHJwUaLGvkYBupw9AJf3ucO/U6y8qHsAJnutuIzd6gHx9cWbwFp
	H0GEUDmukQvGLHWHRRjb56x44GXPCnFbjkSAW/0vKVVBy19QQGC0QyK8PZW5qHWkTjjtesrOT
	dkI6RS430qerc79GVo5NnVOFj+8vJpcbCPlj3CrcbC4X8fLdsupW3uqxPfOBJlGyPOcmplKKz
	+s0x26q6i1OOTIO7TpUMn3riaFVV70Oztje92m7Sb4HtMvCOi65bUwiqMG5ZpgvBAvBt04hnj
	UDxMGID1n7lANoPhC57jdg/jVBFLL/iZFaLafm1ZkWMp3KuGGwgm3pQn4E20q+A9HtwrDR8Xk
	0ikT+JQcuYp427Q4OEwHps1j6xqHNKsoqVCKizOQuV/u1sDIQZ1gOQyaA==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Thu, 08 Aug 2019 12:55:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 08 Aug 2019 12:55:13 +0000 (UTC) for IP:'212.227.15.18'
	DOMAIN:'mout.gmx.net' HELO:'mout.gmx.net'
	FROM:'quwenruo.btrfs@gmx.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 212.227.15.18 mout.gmx.net 212.227.15.18 mout.gmx.net
	<quwenruo.btrfs@gmx.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 0/2] dm log writes: Add support for filter
 bios based on its type
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
Content-Type: multipart/mixed; boundary="===============1328724806487481428=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 08 Aug 2019 12:58:00 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1328724806487481428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="UJjeYQViLV1ROwxoJtPmPkc7BCH810Ccd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UJjeYQViLV1ROwxoJtPmPkc7BCH810Ccd
Content-Type: multipart/mixed; boundary="kUwSWdupgWDROeoUG3SFSfjvAqpoqorlf";
	protected-headers="v1"
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: Qu Wenruo <wqu@suse.com>, dm-devel@redhat.com
Cc: linux-btrfs@vger.kernel.org
Message-ID: <256f2ccc-af5b-e30a-76c1-a911f242d252@gmx.com>
Subject: Re: [PATCH 0/2] dm log writes: Add support for filter bios based on
	its type
References: <20190619080312.11549-1-wqu@suse.com>
In-Reply-To: <20190619080312.11549-1-wqu@suse.com>

--kUwSWdupgWDROeoUG3SFSfjvAqpoqorlf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Gentle ping?

This feature would be pretty useful if we want to really log heavy
operations on a relatively small log devices.

Thanks,
Qu

On 2019/6/19 =E4=B8=8B=E5=8D=884:03, Qu Wenruo wrote:
> Current dm-log-writes will record all bios, no matter if the bios is
> METADATA (normally what we care) or is DATA (normally we cares less for=

> the log-replay context).
>=20
> This causes a lot of extra space required for log device. E.g write 10M=
,
> sync, overwrite that 10M file, this would cause over 20M for log device=

> just for the data.
>=20
> This patchset introduces two way to specify the dump type:
> - dump_type=3D%s optional option for constructor
>   The default dump_type is ALL, thus no behavior change.
>=20
> - dump_type=3D%s message type to change type on the fly
>=20
> Also to cooperate the new dump_type=3D option, always output the dump_t=
ype
> for STATUSTYPE_TABLE.
>=20
> A common use case would be:
>  # dmsetup create log --table 0 $(blockdev --getsz $dev) log-writes $de=
v $log_dev
>  # mkfs.btrfs -f /dev/mapper/log
>  # dmsetup suspend log
>  # dmsetup message log 0 dump_type=3DMETADATA|FUA|FLUSH|DISCARD|MARK
>  # dmsetup resume log
>  # mount /dev/mapper/log <mnt>
>  # <do some work load>
>  # umount <mnt>
>  # dmsetup remove log
>  # <replay>
>=20
> Now the log device will not record data writes, thus hugely reduce the
> space requirement for log device, allowing more operations to be down
> before hitting the space limit.
>=20
> Currently btrfs check doesn't check data checksum by default, thus even=

> we have wrong data on-disk, we should be fine checking the metadata.
>=20
> I'm not 100% sure if this applies to other filesystems, but as long as
> metadata writes is marked correctly, other filesystems can also benifit=

> from this feature.
>=20
> Qu Wenruo (2):
>   dm log writes: Allow dm-log-writes to filter bios based on types to
>     reduce log device space usage
>   dm log writes: Introduce dump_type=3D message type to change dump_typ=
e
>     on the fly
>=20
>  drivers/md/dm-log-writes.c | 177 ++++++++++++++++++++++++++++++++++---=

>  1 file changed, 167 insertions(+), 10 deletions(-)
>=20


--kUwSWdupgWDROeoUG3SFSfjvAqpoqorlf--

--UJjeYQViLV1ROwxoJtPmPkc7BCH810Ccd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl1MG5AACgkQwj2R86El
/qghagf/Q2vvP4Ah6dNhKhOZpgm67p9TSpaMF05UXsYrZ07uebR2QWP7pMoC3eEr
xLEO9d4ikzfqMRf4c6VOLorjPAVzwML6Wi0PwT5EbhPacBNRLBRxlwOzR99dt2RD
CvLE2I5pngFyUpikMsYrIpWaGGJ2P4o/DK0iCyUb5ZBE4gTupIQOm6wdRyzXbjx/
OCm+BHVUNdv2dNDGTOu/08nqyC0ZcKpCkgQWCHfJ0uE16w8SSg8xwl8+vRS9CnK3
IRqlmsX2JaciMzvphgI1ra6lryRI1s8tarYHy0b7ejLM9BI2zqaZSDsr+Xdsd64A
YEzpRrrMpX5Nfu7mRJd/QQalC6g0tA==
=0OJn
-----END PGP SIGNATURE-----

--UJjeYQViLV1ROwxoJtPmPkc7BCH810Ccd--


--===============1328724806487481428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============1328724806487481428==--

