Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80CD5273AFC
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 08:33:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-Em5OE8e8P9y9ek3flWvXfA-1; Tue, 22 Sep 2020 02:33:17 -0400
X-MC-Unique: Em5OE8e8P9y9ek3flWvXfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CA3010066FB;
	Tue, 22 Sep 2020 06:33:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A8185C1D0;
	Tue, 22 Sep 2020 06:33:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E96E5A0FF;
	Tue, 22 Sep 2020 06:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L8oP1o024372 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 04:50:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71756110F0B9; Mon, 21 Sep 2020 08:50:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68EDA110F0B8
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:50:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 075498007D8
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:50:22 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1600678221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=63sQBRnMimhojLWUWbKKaQye33i7joOdobCMMIWxlf0=;
	b=jHpaYCEdwUdaesC8bD+KfWlgHQ88zPmNfWKs/OT3RMYv5zsxjWPgWiOUf6jee10R+mQNj/
	2HXKl8Sk5pP+If+SzlCEgrRYz6Y5eCBaeePJpuVS0gtAFll6TBqW/Rv7bfHih9mJwljsDx
	0zZZhB5zEsVQg2HWiiQcaEqORauJry1WPIdP1/U/6AcZkFXboygommEPbE1tavHhMnDnOm
	Qj8TNTHZZnVVjVsfO28xOA4kYd3ckW9zDJYjRcWhx9IFvXksfaIbepW2hJuh7mEQkL3C2m
	fDg0n4Gml0HRIW3ScFVEzkHUqbBMqVWBuVo5AFAdap41701N05y18BhGiD8TEg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1600678221; a=rsa-sha256;
	cv=none;
	b=hvc8UmuA06OT+gkKjQbs5glgV2/XH7RMo6Qc8p6PpU2ul/1Gr5Yw+0N55bCamZuD441idJ
	GtKHezeXvtjHEp1/inCEcGZbsuIorhxzSfp7No7Xvt/BA1PYg3jPUhMvkh20Z2POHaTiC3
	J+49GlTl98/ulXOMbLAJnTc1FBZqdDVtGSBMl+qXSkfxeyOA3ky6l+sfSI2E6a4p/PSw1+
	GwCZ5m4hAQkLG++UUb2PuMis1t+7wr3umV4Y8i2CFT1hl6l4o/zlwysZIZhC2VB4oi51PF
	314ud6VPuEE0EW1K3rlc+/Bbcm7jtH651Hg/I+UtTCHLjGE+UDo8Otv896zjVQ==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=gmail.com header.s=20161025 header.b=azJctfI6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (relay.mimecast.com: domain of unixbhaskar@gmail.com
	designates 209.85.210.194 as permitted sender)
	smtp.mailfrom=unixbhaskar@gmail.com
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-85-rZkFPzVhP5mcfxWgNH4WlA-1; Mon, 21 Sep 2020 04:50:17 -0400
X-MC-Unique: rZkFPzVhP5mcfxWgNH4WlA-1
Received: by mail-pf1-f194.google.com with SMTP id o20so8664483pfp.11;
	Mon, 21 Sep 2020 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to;
	bh=WGZPvNZ6AV/nbZDpa0AhDOJ7MJQfLtXPAyzzNP7GSmI=;
	b=azJctfI68YJCLulsccoZaFy7rZQJ+Friy8H6IQgGvx+NoUdUvSDRePKKc0LsZOKAiE
	hfBcDCH1Qz4UaHs8bfIuJ5kUi6Atb+8t48nVr5PZxm71a/Y5cNfxy2TyDcViVYLbsz7V
	HSy39BF/ZJJ11CBcKqtINMQFKvkp9LUh9uN/N12qYt15Oeh7l05rfl516lNjPi8Nr+IS
	flLVAJ5sD4A8RWVOv77hnlAvp5CgXlLP97xoCglESzYo69scCqfSLaE0ePq17DOsR6cP
	K4aVPV8IGCDEr0smLs0nU8FljAGPkhDyWma4KPwsIga3K3skAMqBTayX6+wzjoBmeBx0
	0OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to;
	bh=WGZPvNZ6AV/nbZDpa0AhDOJ7MJQfLtXPAyzzNP7GSmI=;
	b=hOosjswRUOTAXBxavC+KlQFp0GOh53V0y101Ym9zyMpmX2NXedzKh/Bq6td8cQN+/l
	2NFiqjvfcAXHPMLe0NAky1j0Y/gd3wtirOFV6lFogYSW7fz1nY916D6FZwkdzeSTdCc7
	CNrqQ+tgIwks2MqNu3qrDmKKvIaRZ1fVFUu56KgIAy0IyPZHAt1iIs2K6EhLDL7glAE6
	Q3xivC7hvF8ekwAMWOylXQ1fLkU85+78VhYGeMDmPA6TyIBuqug95IFX7MarhfiJoTXt
	4+mVvA7dWbPv6E1Rvd/6DhBSG836IwS8kK/AKIK1Iq0zj0jxiQAheCI3jbffQc9+bMlk
	dqng==
X-Gm-Message-State: AOAM532zlPEN5SMRO+/Jg/aPLU3pfxxbxeEobLTLHNSDlFP/bpwxSJj4
	BPmPIrCARd9KdFyZoDaVZ8M=
X-Google-Smtp-Source: ABdhPJwKrtp2q8bS+ncENJczUdH2aZZ+0GiHQClvxQKFk5ML2cC4iNlg0w7e67PTihFKrex0ZDhcpw==
X-Received: by 2002:a05:6a00:8c5:b029:13e:ce2c:88bd with SMTP id
	s5-20020a056a0008c5b029013ece2c88bdmr43001094pfu.0.1600678216079;
	Mon, 21 Sep 2020 01:50:16 -0700 (PDT)
Received: from Slackware (sau-465d4-or.servercontrol.com.au. [43.250.207.1])
	by smtp.gmail.com with ESMTPSA id
	kt18sm9948148pjb.56.2020.09.21.01.50.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 01:50:14 -0700 (PDT)
Date: Mon, 21 Sep 2020 14:19:48 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200921084948.GA20254@Slackware>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Stuart Little <achirvasub@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
	kernel list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>,
	Adrian Huang <ahuang12@lenovo.com>,
	Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
	Ira Weiny <ira.weiny@intel.com>, mpatocka@redhat.com,
	lkft-triage@lists.linaro.org, Jan Kara <jack@suse.cz>
References: <20200921010359.GO3027113@arch-chirva.localdomain>
	<CA+G9fYtCg2KjdB2oBUDJ2DKAzUxq3u8ZnMY9Et-RG9Pnrmuf9w@mail.gmail.com>
	<20200921073218.GA3142611@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20200921073218.GA3142611@kroah.com>
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=gmail.com header.s=20161025 header.b=azJctfI6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (relay.mimecast.com: domain of unixbhaskar@gmail.com
	designates 209.85.210.194 as permitted sender)
	smtp.mailfrom=unixbhaskar@gmail.com
X-Mimecast-Spam-Score: -5
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 22 Sep 2020 02:32:23 -0400
Cc: Jan Kara <jack@suse.cz>, Dave Jiang <dave.jiang@intel.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	kernel list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>, dm-devel@redhat.com,
	Stuart Little <achirvasub@gmail.com>,
	Adrian Huang <ahuang12@lenovo.com>, lkft-triage@lists.linaro.org,
	mpatocka@redhat.com, Dan Williams <dan.j.williams@intel.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel]
 =?utf-8?q?PROBLEM=3A_5=2E9=2E0-rc6_fails_to_compile_du?=
 =?utf-8?b?ZSB0byAncmVkZWZpbml0aW9uIG9mIOKAmGRheF9zdXBwb3J0ZWTigJkn?=
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
Content-Type: multipart/mixed; boundary="===============0572467121044845698=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

--===============0572467121044845698==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09:32 Mon 21 Sep 2020, Greg KH wrote:
>On Mon, Sep 21, 2020 at 11:34:17AM +0530, Naresh Kamboju wrote:
>> On Mon, 21 Sep 2020 at 06:34, Stuart Little <achirvasub@gmail.com> wrote=
:
>> >
>> > I am trying to compile for an x86_64 machine (Intel(R) Core(TM) i7-750=
0U CPU @ 2.70GHz). The config file I am currently using is at
>> >
>> > https://termbin.com/xin7
>> >
>> > The build for 5.9.0-rc6 fails with the following errors:
>> >
>>=20
>> arm and mips allmodconfig build breaks due to this error.
>
>all my local builds are breaking now too with this :(
>
>Was there a proposed patch anywhere for this?
>
>thanks,
>
>greg k-h

I don't know Greg,but it builds for me with these config :

bhaskar@Slackware_14:14:31_Mon Sep 21:~> cd /data/linux
=E2=9C=94 /data/linux [master|=E2=9A=91 1]
14:14 $ grep DAX .config
CONFIG_NVDIMM_DAX=3Dy
CONFIG_DAX_DRIVER=3Dy
CONFIG_DAX=3Dy
CONFIG_DEV_DAX=3Dm
CONFIG_DEV_DAX_PMEM=3Dm
CONFIG_DEV_DAX_KMEM=3Dm
CONFIG_DEV_DAX_PMEM_COMPAT=3Dm
CONFIG_FS_DAX=3Dy
CONFIG_FS_DAX_PMD=3Dy


and it gets booted by qemu ....like this=20

[    5.134563] devtmpfs: mounted
[    5.164729] Freeing unused decrypted memory: 2040K
[    5.314950] Freeing unused kernel image (initmem) memory: 1600K
[    5.316543] Write protecting the kernel read-only data: 26624k
[    5.327037] Freeing unused kernel image (text/rodata gap) memory: 2040K
[    5.331005] Freeing unused kernel image (rodata/data gap) memory: 876K
[    5.331861] rodata_test: all tests were successful
[    5.332872] Run /sbin/init as init process
[    5.694654] EXT4-fs (sda): re-mounted. Opts: (null)
[    5.695839] ext4 filesystem being remounted at / supports timestamps unt=
il 2038 (0x7fffffff)
Starting syslogd: OK
Starting klogd: OK
Running sysctl: [    6.974188] random: crng init done
OK
Initializing random number generator: OK
Saving random seed: OK
Starting network: [    8.293018] hrtimer: interrupt took 4569776 ns
OK

Welcome to Buildroot_Linux
Bhaskar_Thinkpad_x250 login: root
# uname -a
Linux Bhaskar_Thinkpad_x250 5.9.0-rc6-Slackware #1 SMP Mon Sep 21 11:42:03 =
IST 2020 x86_64 GNU/Linux


~Bhaskar

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl9oaSgACgkQsjqdtxFL
KRWNQwgAmjlpIbY42uBabMCy++pqyyzc4Jq9sz9SHbENTdvsPvBV6FPDleUI6DMP
3egPCVbC5vEB19r6MYqFuq4L9Y7kuXdDd3P+52v8/gJ7HOOQDDd4lIG0YCyxH1RI
Lx7Lb/9/WTISo2JYsqlrgaPY8PWjF+aGZrN24TFXuH6YlSTf+ck24RfZxPoRtAO9
kTp9s4HBHPXlQcHHBscLIRdq9sGlHbYew3VxtlGz0DhP9bbMOuvER8Ick3Y+rGSb
DyUfgPU3T8Q/SinM51LUBR7WGqAoi1x4DjcAp1ZGOXB0AF5XKz2nLkvAbwBe2bqH
NF1e9TEZ4GLiQK4oKjhvXvl58jz1JA==
=yKt3
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


--===============0572467121044845698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0572467121044845698==--

