Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEE5CB500
	for <lists+dm-devel@lfdr.de>; Fri,  4 Oct 2019 09:30:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D29DB10CC1F1;
	Fri,  4 Oct 2019 07:30:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE355D9DC;
	Fri,  4 Oct 2019 07:30:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F72D1808878;
	Fri,  4 Oct 2019 07:30:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x947UBjX004820 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 03:30:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1F92600C4; Fri,  4 Oct 2019 07:30:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F7C6046B;
	Fri,  4 Oct 2019 07:30:09 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 146E199C42;
	Fri,  4 Oct 2019 07:30:06 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Fri,  4 Oct 2019 07:29:27 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 4 Oct 2019 07:03:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 4 Oct 2019 07:03:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jmlFCjreNOmYMSjOKSf+MAiM1OAx4/lXww5XEf5T/0Wnt/t7t2qeLJWFIsQa+LM2nLYEVepdnjVV2W4ceMFnoiTC/0tHkfpogOeb3bDccVn/w4gkx72B7DffZ76svYfu6mXVG7Lr8nVW3i4zTDznAyhgrcLs7sk2iv7qZ2LA2fvZHOmSAPFDxehd5IjVeNsa9ZitBafI4BI8cX8wS3BQLSLRJc4/SnKUH0UHfrTT8RE0v8YySBEqqjm3azIemDwzRZ7Ddkzo92UkeZG4zzGBWhP7hKwF5wwW0dydH0BIl3jUBkxNYWY3Sr9EkuIn1quxU1V+udoFCSVqvLoRO5cwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=quSqr07pIHGRSDyIWZFVB4NfQQN6UuH6QMrgqttwVnE=;
	b=IuQe/KR8L/+yEZpFBAm8kEnZt8FtPfqSGxbFI6jg04i/ch8x39XrLKrD90tiZgtJkY1z6quuahg8csIEejAIkf1sI6TYcvrvtZ4+v6aq6G4f2CRjgFo8Vd4aFFzZC76JDS9Nsgvb8jlTKENtSfpFBbVA1UI3zOgW0rSlH5K2S7fkmvjc2CuwezMXcPvAYPuVzTOqMMDAGbu1FelHPPcPYA0ohixbo8bja8hdoQDl+DIxUsj43j49+lV4HAL8/NkPuNgis2ZyYLPFMiz00o/jZoHjFLaOKvCtdh9ExnnOMSgt7P8hGJ0LB8yF24niDDzAQdtpMo0z6xGQPIs25EcSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3269.namprd18.prod.outlook.com (52.132.245.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Fri, 4 Oct 2019 07:03:27 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2305.023;
	Fri, 4 Oct 2019 07:03:27 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "xose.vazquez@gmail.com"
	<xose.vazquez@gmail.com>
Thread-Topic: multipath-tools: RH-patches for upstream ???
Thread-Index: AQHVeoHRF/rLQgi/70K7O53hqETajQ==
Date: Fri, 4 Oct 2019 07:03:26 +0000
Message-ID: <5d38873e4ea51f00d1d49e9e9fb86419542598e8.camel@suse.com>
References: <e2b955d0-69ea-2c2b-9f0f-ccf3b5f369d0@gmail.com>
	<20191003214420.GE25414@octiron.msp.redhat.com>
In-Reply-To: <20191003214420.GE25414@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c8b50d7-6c31-4603-b3f9-08d74898f48f
x-ms-traffictypediagnostic: CH2PR18MB3269:
x-ms-exchange-purlcount: 8
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3269CC10E6156AC35D63347AFC9E0@CH2PR18MB3269.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(189003)(199004)(316002)(8676002)(66066001)(2906002)(14454004)(5660300002)(6246003)(305945005)(110136005)(478600001)(6506007)(91956017)(25786009)(86362001)(256004)(486006)(54906003)(14444005)(2616005)(11346002)(476003)(229853002)(446003)(76116006)(71200400001)(6512007)(71190400001)(76176011)(3846002)(6436002)(6116002)(107886003)(66476007)(4326008)(66946007)(81166006)(8936002)(2501003)(81156014)(118296001)(102836004)(966005)(36756003)(66556008)(26005)(7736002)(186003)(66446008)(64756008)(6306002)(99286004)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3269;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZWWAdttynaM03RQJ5etykuVZRVLpJTTVOH4EEX0FchwCGQ2m0Xjw3hODkFejsee+ymaHbuADFkj8femEb8BWoXY7+DxIPMRr4O8DsjU9ptHuNGZr2F763/n7W8gd+rFFa5XOyedGVGRW0duJKf6+z24+t2ufNd7BzQgxDsGpv6XwvFb1MKOwZL+3OhEuhB8DO9r4hk65fMTELMIAjTcUlHZbjKepUTpaHg90Ieg5z+ix1NfC3vm65wnXAaUEIYs5lTCmUc9GemC/C0xr6MPxeJ8bEwWWMB2OZVdlSoDJBLPHjPNA4KjwLZHnG8tLV3IRRliFch0SF1HjVd/R65l9WPW0Q0VaMqXLBWx5bUYzv8ZuaDDUaLbL/vxrFewWMoLV7cBsDZVerF2w2wQKHTh4Fjez4V4b4qoszFsVmWeJaGip0ztWpFqkw6yybN20J67z/n9YWTAEDGhBHbAB44fInw==
Content-ID: <B5EA101DCFB37841BA149AE71BED68C9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8b50d7-6c31-4603-b3f9-08d74898f48f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:03:26.9393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcHu4d3KqAlw59Ptq256Tnh6OkzozK+fmHUEQOYyLvud/2gR7UqlnIcEQ5TitfaCrKGdtYjx3zlzl38P67eXEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3269
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Fri, 04 Oct 2019 07:30:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 04 Oct 2019 07:30:08 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x947UBjX004820
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Hannes Reinecke <hare@suse.com>
Subject: Re: [dm-devel] multipath-tools: RH-patches for upstream ???
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Fri, 04 Oct 2019 07:30:48 +0000 (UTC)

Hi Xose, hi Ben,

On Thu, 2019-10-03 at 16:44 -0500, Benjamin Marzinski wrote:
> On Thu, Oct 03, 2019 at 08:28:06PM +0200, Xose Vazquez Perez wrote:
> > Hi Benjamin,
> > 
> > 
> > Is there any relevant RH-patch for upstream in fedora repo:
> > https://src.fedoraproject.org/rpms/device-mapper-multipath/ ???
> > 
> > Maybe:
> > 
> > - 
> > https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
> > 
> >    Subject: [PATCH] RH: Remove the property blacklist exception
> > builtin
> > 
> >     Multipath set the default property blacklist exceptions to	
> >     (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some
> > internal
> >     devices.  These devices may never have multiple paths, but it
> > is nice
> >     to be able to set multipath up on them all the same.  This
> > patch simply
> >     removes the default, and makes it so that if no property
> >     blacklist_exception is given, then devices aren't failed for
> > not matching
> >     it.
> 
> Redhat doesn't include the udev rules file that sets ID_SCSI_VPD, so
> there are some rare cases where this property blacklists valid
> devices.
> Thus, it's easier for us to simply include this property line in the
> default multipath.conf, and let users remove it if necessary. I would
> be
> fine with this being included upstream, but I suspect it would mess
> with
> other ditsros which are currently assuming that it is there.

Hm. ID_SCSI_VPD is nowhere referenced in the upstream code. The default
is "(SCSI_IDENT_|ID_WWN)", where SCSI_IDENT_ could be regarded as a
SUSE-ism because the SCSI_IDENT_* properties are set by sg_inq / sg_vpd
calls, and I'm not sure if other distros consequently use sg_inq rather
than scs_id like we do. We (SUSE) have been working on replacing
scsi_id by sg3_utils calls in upstream systemd, but so far that hasn't
been merged, systemd maintainers are very cautious about touching these
udev rules.

I'd be interested in seeing an example for a device that is erroneously
excluded by the default blacklist rule.

In general, it's a shortcoming of multipath-tools that the built-in
blacklists can only be appended to, not replaced, by user
configuration.

> > 
> > - https://src.fedoraproject.org/rpms/device-mapper-
> > multipath/blob/master/f/0026-RH-add-wwids-from-kernel-cmdline-
> > mpath.wwids-with-A.patch
> > 
> >    Subject: [PATCH] RH: add wwids from kernel cmdline mpath.wwids
> > with -A
> > 
> >     This patch adds another option to multipath, "-A", which reads
> >     /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids
> > it finds
> >     to /etc/multipath/wwids.  While this isn't usually important
> > during
> >     normal operation, since these wwids should already be added, it
> > can be
> >     helpful during installation, to make sure that multipath can
> > claim
> >     devices as its own, before LVM or something else makes use of
> > them.  The
> >     patch also execs "/sbin/multipath -A" before running multipathd
> > in
> >     multipathd.service
> > 
> 
> I posted this upstream and Hannes NAKed it a while back. We still
> find
> it useful, since the default multipath.conf file for Redhat sets
> find_multipaths to yes. You can currently avoid the race that this is
> fixing by setting find_multipaths to smart, but there were objections
> to
> using that as a default in Redhat. However, I never really understood
> the objection to this patch, and I'd be fine with re-posting it.

https://www.redhat.com/archives/dm-devel/2014-July/msg00011.html

I'm with Hannes. Doing this in dracut, udev rules, or systemd service
files seems cleaner to me than yet another daemon that tries to
interpret the kernel command line.

See e.g. how we implemented multipath=off (cd3184e).

> > - 
> > https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
> > 
> >    Subject: [PATCH] RH: warn on invalid regex instead of failing
> > 
> >     multipath.conf used to allow "*" as a match everything regular
> > expression,
> >     instead of requiring ".*". Instead of erroring when the old
> > style
> >     regular expressions are used, it should print a warning and
> > convert
> >     them.
> c45d2a0e
> When multipath used its old regex code, "*" worked to match
> everything.
> This patch just exists to make sure that customers didn't need to
> change
> their configs when the regex code changed. Since it's been there
> posting
> warning messages for a while, I plan to eventually drop it entirely,
> and
> let anyone who has been ignoring the warning messages for years
> finally
> have their config error. I see no reason to add it back to the
> upstream
> code now.

Ack. Upstream has removed support for "*" in 2014 (b9d11f3), and did
it deliberately.

>  
> > - 
> > https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0028-RH-reset-default-find_mutipaths-value-to-off.patch
> > 
> >    Subject: [PATCH] RH: reset default find_mutipaths value to off
> > 
> >     Upstream has changed to default find_multipaths to "strict".
> > For now
> >     Redhat will retain the previous default of "off".
> 
> This is simply to retain the previous default behavior, for much the
> same reason as the above patch. I see no reason to change this
> upstream.

Ack. Btw SUSE changes the default, too (to "greedy", though).

> 
> > - 
> > https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0029-RH-Fix-nvme-compilation-warning.patch
> > 
> >    Subject: [PATCH] RH: Fix nvme compilation warning
> > 
> 
> I assume that other people aren't seeing these compilation warnings,
> and
> this it due to different options that redhat uses when compiling.  I
> really should push this patch upstream, but that upstream isn't
> multipath-tools, its nvme-cli, where we copied this file from. Once
> it's
> changed there, we can pull the updated files back to multipath-tools.

Ack. Which compiler option triggers this warning?

>  
> > - 
> > https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0030-RH-attempt-to-get-ANA-info-via-sysfs-first.patch
> > 
> >    Subject: [PATCH] RH: attempt to get ANA info via sysfs first
> > 
> >     When the ANA prioritizer is run, first see if the "ana_state"
> > sysfs file
> >     exists, and if it does, try to read the state from there. If
> > that fails,
> >     fallback to using an ioctl.
> > 
> 
> This won't do anything upstream. This requires a redhat specific
> kernel
> patch that wasn't accepted in the upstream nvme kernel code.  It
> really
> doesn't make much of a difference. It just makes multipath try to
> grab
> ANA state info from sysfs, before failing back to the same ioctl that
> upstream uses.

Ack.

Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
