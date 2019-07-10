Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333A64DF8
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jul 2019 23:21:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0163985539;
	Wed, 10 Jul 2019 21:21:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F44A60BFB;
	Wed, 10 Jul 2019 21:21:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 466F118355D9;
	Wed, 10 Jul 2019 21:21:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6ALL4AL012875 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jul 2019 17:21:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD85B5C220; Wed, 10 Jul 2019 21:21:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B77825C25A
	for <dm-devel@redhat.com>; Wed, 10 Jul 2019 21:21:02 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64484C057E7D
	for <dm-devel@redhat.com>; Wed, 10 Jul 2019 21:21:00 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 10 Jul 2019 21:20:50 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 10 Jul 2019 20:48:11 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 20:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Nht8JgtaQiw+TV8A0Eiguk5h7CcF6ZHqh6gB+XMs49RMiLSqHeXMKx9A7lLXCoZX3WuZtZLIY28Zqc9QmZ4umRHUKMO8kUOKZ+31fD5o4dujWI3PzH7VJEsCOtKYU6BN4FYlyETzst6SkX1F3D9rp1GqcgRs/C0en7hRuSY9ohHaEeMHBWphbHWVbrPPQ3/yEWmu8t/vgghBBJrdPp5cyuo+SJDK4Acd9MdmQJ0YLGtHWlg7MTj6ONhkhiG0XA5B7Ib195lvDv1uxMjU9/IoOfTq1Oxvd//VUG82gCNQozZyfnFMb9T9PGnmm/QhjLDW59AqQ23HfyHf2SIB0vhbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iyViHVlRFjHWLGKXavfd0nkDXlsFYJvwEjZesFRWef4=;
	b=GpQ3YAWrQXw4V9gPKs6Ha+zj7OXWh8qDSBnOAOJYg5TBF52myVQbpNGeBenDa2zk/sNnITpzP+m6vNtFm19fG97pRcqs3VHCDPD3TVn8DI7bjxOuvICkb/vp5VoUgT6l/vkijgwLhdZvi3M+Rmljj3AWO7dMLhBWxj3cwjRo9XRr7WP13Iq28Sc4HZrcqGxR7p478BWT0CrxpQl21h2qxkZ8KYmvQGe0ML2jWO8U6K3mj+epgQRSeF18rjqjzUfz2rWS4Nx6HgkrGKme7gePKcmlxk0MCS/XTf1mMPfIjLBKeBR547JxlU0/FiLsCJTfrVSbVgpfRDmun/ZBOFqkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com;arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3414.namprd18.prod.outlook.com (52.132.247.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.10; Wed, 10 Jul 2019 20:48:09 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2052.020;
	Wed, 10 Jul 2019 20:48:09 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "rogerheflin@gmail.com" <rogerheflin@gmail.com>
Thread-Topic: [dm-devel] [PATCH 4/4] libmultipath: trigger uevents for
	partitions, too
Thread-Index: AQHVNimGkr+11WhtHUKMLNds+BG+ow==
Date: Wed, 10 Jul 2019 20:48:08 +0000
Message-ID: <d0ac134ae894884f7bbadb3449b11ab2a9867092.camel@suse.com>
References: <20190709073909.32112-1-martin.wilck@suse.com>
	<20190709073909.32112-5-martin.wilck@suse.com>
	<CAAMCDeeC31_C_4_CWXucmA2zeTvVqig3CsUmikfuuJA1V5YWRg@mail.gmail.com>
	<ba52db4bc532fe1f0ab4af0981c140eb4f339d68.camel@suse.com>
	<CAAMCDeeiDbQfmF8NrOpy5MHjaX3AvbA7VytAeZSoDb0z9R17vg@mail.gmail.com>
In-Reply-To: <CAAMCDeeiDbQfmF8NrOpy5MHjaX3AvbA7VytAeZSoDb0z9R17vg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e813502-b19a-430c-8a87-08d70577eab7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3414; 
x-ms-traffictypediagnostic: CH2PR18MB3414:
x-microsoft-antispam-prvs: <CH2PR18MB3414702358E062386AB42A75FCF00@CH2PR18MB3414.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(189003)(52314003)(199004)(6506007)(4326008)(26005)(1361003)(486006)(476003)(81166006)(11346002)(2351001)(2616005)(316002)(68736007)(2906002)(478600001)(186003)(1730700003)(81156014)(8676002)(102836004)(5660300002)(66946007)(76116006)(66476007)(66446008)(64756008)(66556008)(66066001)(25786009)(91956017)(71200400001)(71190400001)(36756003)(118296001)(8936002)(6512007)(7736002)(86362001)(305945005)(6916009)(99286004)(2501003)(6436002)(6246003)(76176011)(5640700003)(14454004)(446003)(1411001)(53936002)(14444005)(256004)(6486002)(229853002)(3846002)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3414;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 51BMa4LRovegKaqryR/0L40lylO5f+By5VVnG30Qoso59FeL1fopj1N3XJ+mIX0Kw0TNMswqPLQ65w2zaK2AqNd13dz9W9vj9erewTbghRbN4cR0sdIqx3BTMjEE8BWl6ipRGx/JBFQZHBJkd2VuSKD+aoncrh7Fm/RfTTEuQ8H3bVzBx41Dj+RiyB2XMAGoOECTFEp+sIA7b6UreNsMerptUaFqODSWeV5ZcO8KNBpTr1cvR3WFNBIHe1ciM/X4zqrIrw4IULa6UEO/Iu8nDNmi8/GYEupNwPsGBjjjfitRmyPJENiYCuy8Nvgkb2/NAgWiaKC8bDBRxcXtB3YvS1iEiByLgPvTWbesIi1Q2vmI0yMTz9JAtndg1eJ9jWPplxuRYT4sT0Q2kYaZ2lBRM/A2j/uDFwdlKxJaSpgplMY=
Content-ID: <541A032FF8465C4F94F947B676A7A4FF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e813502-b19a-430c-8a87-08d70577eab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 20:48:09.0060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Martin.Wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3414
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 10 Jul 2019 21:21:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 10 Jul 2019 21:21:01 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6ALL4AL012875
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmultipath: trigger uevents for
 partitions, too
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 10 Jul 2019 21:21:44 +0000 (UTC)

On Wed, 2019-07-10 at 12:42 -0500, Roger Heflin wrote:
> 
> The OS we have uses 62-multipath and does not have a global override
> like that.
> 
> I am looking at my notes on the issue and it was this:
> rootvg gets started directly on /dev/sda2 and then multipath starts
> up
> and attempts to mange it and deletes the partition on /dev/sda1
> causing the by-uuid link to be invalid but multipath fails to create
> the device with "map in use" because the lv's for rootvg are live on
> /dev/sda2 directly.   So it does sound like your fix would would
> correct this issue since on the multipath failure to manage it would
> recreate the /dev/sda1 device.  

Yes, it's certainly worth a try. This is the case the patch was made
for. You must make sure that your distro contains the commits it builds
upon (c5023200, e5d3c3a0). All this is fairly recent stuff.

> There appears to be some race
> condition in the initramfs/systemd where sometimes rootvg gets
> started
> before multipath has managed the device causing the partition to be
> deleted (we have multipath is the initramfs, and that was confirmed).

That should never happen. The multipath udev rules set SYSTEMD_READY=0
on the devices, thus lvm must refrain from grabbing them. Maybe
multipath_component_detection is off in your LVM2 setup?

> All of our other vg's dont have this issue as we are using the
> rd.lvm.vg= such that only the rootvg gets turned on early.
> 
> > Also, the rule only removes partitions for devices that have been
> > detected as being eligible for multipathing.
> > 
> > > The symbolic link does not appear to get re-created to point to
> > > the
> > > new multipath device which would lead one to suspect that there
> > > was
> > > no
> > > event happening for when the multipath device is created.
> > 
> > That's very unlikely. You should verify that the multipath device
> > (for
> > sda) is created. My patch here relates only to the case where
> > creating
> > the multipath device *fails*.
> > 
> ?
> > Maybe. I don't know enough details about your configuration to
> > tell.
> > But if this is a device that should not be multipathed, from my
> > point
> > of view, proper blacklisting via multipath.conf is the recommended
> > way
> > to handle this problem.
> > 
> > You can also use "find_multipaths"; please check the documentation.
> > Note also that since 0.7.8, blacklisting "by protocol" is possible,
> > which makes it possible e.g. to blacklist local SATA disks with a
> > simple statement.
> > 
> We intentionally have find_multipaths set to allow a single path. 

But the map which is causing the problem does have multiple paths, if I
understand correctly? Not all past versions of multipath-tools behaved
consistently with "find_multipaths yes"; if you have such a version,
that might even explain the race you were talking about. But this is
speculation. The behavior depends on which commits exactly are in your
code base.

Anyway, I can't say much about it without knowing all the details. It
seems that you should contact your distro vendor.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
