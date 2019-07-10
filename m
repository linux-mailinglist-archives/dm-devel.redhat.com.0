Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19F64564
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jul 2019 12:50:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A39A3086213;
	Wed, 10 Jul 2019 10:50:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BCCF83764;
	Wed, 10 Jul 2019 10:50:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A6F041F53;
	Wed, 10 Jul 2019 10:49:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6AAngpa019513 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jul 2019 06:49:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 436D12B450; Wed, 10 Jul 2019 10:49:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08889196FB;
	Wed, 10 Jul 2019 10:49:40 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EC9330C34D0;
	Wed, 10 Jul 2019 10:49:33 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 10 Jul 2019 10:49:37 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 10 Jul 2019 10:41:55 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 10:41:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lvVa2LLLzR0Yxe5Pjc/Xmatk3i1O1ej8dE/ciUyXrAL66MCOvpHghsuk5T82vekkgClk3nktH8PhuS9D+rWwokxP3bT04XNaEpPLU+aVjuR/sLXkAQdtVTx9DObAGzpcbqdXX0q6m0qQEHH3poca8wPokbcNbTfzt8w9k2Jk5l99an/inZzqtJ3j6ENnqQLVB1fyarcPBqe4gdl53QinEMbv7L1BWVwk8SZ4ZyFmLLhad8johJ9icD1rn+Tew4arnkaESZODoqFeT5WKJbrw8p4n2wRiYMUGCSrJRkS129WMxP16zQ0YN1R/MtEHOaVHxsd+5JpM74oknkBjrpqdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kSdGLruRreXUsntaw3tFgodlPfovCHsVVDV1LPIXdkg=;
	b=MeoqBM3qqHmocjHzZlorxMnpyt9GfGNKMrce3adGwpRJq6f+EpITfNd/kBwI1EZBe5a80pdNWFkRr9CTJ2dCtZp63bcmt2b3XqhWB56IJZB3gxSiaQACQN1zYs6KVGkdBnGAIYAXuTQo2iWfr7QJTJy+OkJOR1F56SYBlapD2xV/TATSghISVf26dkiRk5oVvKkdjhj2WxVi3kfF8HHTom/MqgYbdLHxML/LvVID6SVcI8P0KGnsprTTyHmRZ01n4QwOmylI5uktIwXUdKo9yNPiW8E4HAz4sn58XIXVM/FMQP0l6378jO8avOK3TEG6hbTNDOUVj8joljRz5YRIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com;arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3367.namprd18.prod.outlook.com (52.132.246.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.10; Wed, 10 Jul 2019 10:41:54 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2052.020;
	Wed, 10 Jul 2019 10:41:54 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "rogerheflin@gmail.com" <rogerheflin@gmail.com>
Thread-Topic: [dm-devel] [PATCH 4/4] libmultipath: trigger uevents for
	partitions, too
Thread-Index: AQHVNimGkr+11WhtHUKMLNds+BG+ow==
Date: Wed, 10 Jul 2019 10:41:53 +0000
Message-ID: <ba52db4bc532fe1f0ab4af0981c140eb4f339d68.camel@suse.com>
References: <20190709073909.32112-1-martin.wilck@suse.com>
	<20190709073909.32112-5-martin.wilck@suse.com>
	<CAAMCDeeC31_C_4_CWXucmA2zeTvVqig3CsUmikfuuJA1V5YWRg@mail.gmail.com>
In-Reply-To: <CAAMCDeeC31_C_4_CWXucmA2zeTvVqig3CsUmikfuuJA1V5YWRg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d35d017-3cea-4e44-eaa0-08d705233955
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3367; 
x-ms-traffictypediagnostic: CH2PR18MB3367:
x-microsoft-antispam-prvs: <CH2PR18MB33675195A10C0CB6047C5E13FCF00@CH2PR18MB3367.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(189003)(199004)(86362001)(76116006)(14454004)(7736002)(66476007)(8936002)(91956017)(64756008)(8676002)(66946007)(66556008)(1730700003)(81156014)(81166006)(305945005)(316002)(6512007)(66446008)(6436002)(118296001)(54906003)(25786009)(68736007)(53936002)(1361003)(446003)(476003)(2501003)(71200400001)(11346002)(229853002)(71190400001)(36756003)(5660300002)(4326008)(1411001)(76176011)(2351001)(6506007)(5640700003)(486006)(256004)(14444005)(478600001)(26005)(6116002)(66066001)(186003)(6916009)(6246003)(3846002)(6486002)(2906002)(99286004)(2616005)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3367;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xi4zzBsV19ahFIoLT700zQiXEXIqJ5dNhkpQwX9txYMKbcxD87b+VA83BzPwDt3KreyiVHSoDXCUfJXNc9ogyAPDiSY768M/F4WYfbaVdazZFglkUXWhpSREJt2GS1NtjyeGhS1GKgI3x/TTtfh61OmknkiBkGEjDBmElbucqaB3Nqstq5p8Ir3bah8fVAgeAcR0ytX5Be0sXaQUFIlgptgfM3aWIMehNtkDkyzNarolJNIbU+GODnHEk8UhXEyHO/lonCs5XXBrjl0rwtJBMjZCgiQ3Bm540OLK/EyVTyp2/4QhPEs7hnbXWG9zDL3hdsC+jiOyhIUxMlE7/+KQO++JETI6JtizVCswGdy2LWlEKrBg40Qe2YRPDeda3xJZ7kbzMHq63DbRHR8XpnLrg9NU3fOqbS43SsmJdrrUwxo=
Content-ID: <D7DEFD9F64B81E4D8E194345B8450CF1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d35d017-3cea-4e44-eaa0-08d705233955
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 10:41:53.8701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Martin.Wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3367
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 10 Jul 2019 10:49:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 10 Jul 2019 10:49:39 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6AAngpa019513
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 10 Jul 2019 10:50:12 +0000 (UTC)

On Tue, 2019-07-09 at 11:40 -0500, Roger Heflin wrote:
> We have an observed behavior as follows:
> 
> When the host boots up, a uuid symbolic link is created pointing at
> /dev/sda1 (device for /boot)
> 
> Multipath starts up and creates an multipath device to manage
> /dev/sda
> and a udev rule deletes /dev/sda1 invalidating the symbolic link.

I suppose you are talking about 68-del-part-nodes.rules. Note that the
rules in this file can be deactivated by setting
ENV{DONT_DEL_PART_NODES}="1" in an early udev rule.

Also, the rule only removes partitions for devices that have been
detected as being eligible for multipathing.

> The symbolic link does not appear to get re-created to point to the
> new multipath device which would lead one to suspect that there was
> no
> event happening for when the multipath device is created.

That's very unlikely. You should verify that the multipath device (for
sda) is created. My patch here relates only to the case where creating
the multipath device *fails*.

If the creation of the multipath device succeeded, my patch would have
no effect on your system. In that case you should also verify that the
kpartx devices on top of it were created. I advise to boot with
"udev.log-priority=debug" and check what udev is actually doing.

> Right now our solution is a manual solution of blacklisting the
> device
> with /boot on it.
>
> Would this fix triggering an event on the multipath device partitions
> be expected to correct the above issue?

Maybe. I don't know enough details about your configuration to tell.
But if this is a device that should not be multipathed, from my point
of view, proper blacklisting via multipath.conf is the recommended way
to handle this problem. 

You can also use "find_multipaths"; please check the documentation.
Note also that since 0.7.8, blacklisting "by protocol" is possible,
which makes it possible e.g. to blacklist local SATA disks with a
simple statement.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
