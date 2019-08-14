Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7208DFC0
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:28:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 018DC6374B;
	Wed, 14 Aug 2019 21:28:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C71AF10001B8;
	Wed, 14 Aug 2019 21:28:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A99C2551C;
	Wed, 14 Aug 2019 21:28:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELRKcW006283 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:27:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2118A8BE47; Wed, 14 Aug 2019 21:27:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB1F5D9DC;
	Wed, 14 Aug 2019 21:27:17 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9BE425CCB;
	Wed, 14 Aug 2019 21:26:45 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:26:24 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:21:34 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:21:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GrC91xDU45WFs45LxpLhs4OpAr7y0zXsiSepg0dx9l7tTlWEfcMjPPXBzM0DRY2wxMJ8itIoHjlUiBVDKgyZEIHi5YK6cfFY4N0VGWnp9flY6F2+2IocfOWNyMJkmMqsWRCpBXK/IBgfjymXINsB3WxQbqNVIXyyX577/wxoBHKOC8Zp/LdUInfXAClKNVEu0CVG4FYYsVK6ypl/GsjpHTbU6Q2mr8BZWhxbayokUhJEO41JHu49Bh5XUUqaenijZthfwjBI267gpCGEjO2gXWXNZWYnACD64BE7DTNJ93RcEt1yMc8GtjLZ1KNSX/q5wk2/pc0f0Tnqeuf0pTYkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=F75j8VJ6zGwDY9cH4MTbtdC7KEk5TviFYNWFlBqTbXs=;
	b=Rdz+klljTjLxgC5ndEvJf2Sdv/hamJI7s+9e9miNktaewCiml9JHYxLd6RFX6fkYjwUh71FKQbNquwaZeqQ90FqLJJvXlk28P0JGZeC8lRMjX8cuTxI42wyypz7pLC8xsVeAPtafftfV8GWsLWNc+K5H5E65v8ehE+ayIEQp6ldR68Vrs9syCO5oIr+Z8CyZRPwc/MGLbbBa8J89I0dtiFDXRF338DQSfuiwAdxK1JMpkWfx0di/ywJ7K7t8cnqCS3PMcMO0zzZeg0GcQxX59FVSutEI290ts2nPy7TkHd67dJfqjVzrKphmrUlOcv47W7j6k3q3kqYQCWvLBR+xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3240.namprd18.prod.outlook.com (52.132.245.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:21:33 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:21:33 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 16/16] multipath: update man pages
Thread-Index: AQHVUuY+W3pdqFzhyk+Mjf9rbE4BDA==
Date: Wed, 14 Aug 2019 21:21:32 +0000
Message-ID: <d563722667ec1caba7a072b6df632844e64ea690.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-17-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-17-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ce5e3b0-fd4d-433e-3759-08d720fd6186
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3240; 
x-ms-traffictypediagnostic: CH2PR18MB3240:
x-microsoft-antispam-prvs: <CH2PR18MB324077F8B77A8EF3E89D6AE3FCAD0@CH2PR18MB3240.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(66946007)(64756008)(66476007)(81156014)(102836004)(76116006)(91956017)(99286004)(6436002)(478600001)(8676002)(4326008)(186003)(6506007)(81166006)(71200400001)(486006)(76176011)(6486002)(71190400001)(305945005)(6116002)(66446008)(2501003)(446003)(14444005)(14454004)(54906003)(316002)(86362001)(476003)(7736002)(2616005)(25786009)(8936002)(229853002)(11346002)(5660300002)(26005)(2906002)(6246003)(118296001)(256004)(3846002)(66556008)(53936002)(6512007)(66066001)(36756003)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3240;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qKN4Q1Lccd2cLvRg/5jQD9AouMyMlgHLSbqpBXF8u4bKYXU0wcMRYUafY8e8P07k5BO1nGeuuN1s/q1E7n1bdruZE0JgmK/TXc+oM2oTxAzOYBb8Kemh59K0Hd0KP84v5mx5SLFeFfPtQ1RJsalLCnDCXmEbFshpTCPwkIoASnfpTZ6ee5Oqscm9RfgNUd3QU6J4xgIa/PG1NDSRY3409W8NX1g4Fh3p68SeAPW2FFDuZo+enPCi2+4zIS47rp5Nn7QZsHaE2ZCXb9rMuG7Je6o2l923VmiFuEpK7aiohMn7Fx3eUgix3GqZOUEjHCBg6ROY+XEHcSyRWHC53JlMWg0EsTFzm/sQOltbx39abuiWchjLaiap7ja/ML4iyNcL0lCZnMCsQ+R8RyeskSnpDfVRgSMyXIooXndiTvmSwOU=
x-ms-exchange-transport-forked: True
Content-ID: <A5462B9F62218F4B999B21B49DE3353D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce5e3b0-fd4d-433e-3759-08d720fd6186
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:21:32.9306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByKSo6r/sthL4SrfHqoIJMau6v2E+UIDXeEZ2qlC6EWMdU+WwqOz4ag3dtTVGbc8Cy64meuMuteqc5vi8ui+lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3240
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Wed, 14 Aug 2019 21:27:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 14 Aug 2019 21:27:17 +0000 (UTC) for IP:'15.124.2.86'
	DOMAIN:'m4a0040g.houston.softwaregrp.com'
	HELO:'m4a0040g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.86
	m4a0040g.houston.softwaregrp.com 15.124.2.86
	m4a0040g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELRKcW006283
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 16/16] multipath: update man pages
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 14 Aug 2019 21:28:14 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> Add documentation for the marginal_pathgroups option and the
> (un)setmarginal commands.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipath/multipath.conf.5 | 34 ++++++++++++++++++++++++++++++----
>  multipathd/multipathd.8    | 19 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 4 deletions(-)
> 
> --- a/multipathd/multipathd.8
> +++ b/multipathd/multipathd.8
> @@ -277,6 +277,25 @@ Remove the persistent reservation key associated
> with $map from the
>  \fIreservation_key\fR is set to \fBfile\fR in
> \fI/etc/multipath.conf\fR.
>  .
>  .TP
> +.B path $path setmarginal
> +move $path to a marginal pathgroup. The path will remain in the
> marginal
> +path group until \fIunsetmarginal\fR is called. This command will
> only
> +work if \fImarginal_pathgroups\fR is enabled and there is no Shaky
> paths
> +detection method configured (see the multipath.conf man page for
> details).

This is counter-intuitive. It's unclear to me why we need these
commands at all. By nature of "shaky" paths, it doesn't make a lot of
sense to make these settings (only) manually. I'd like it better if the
cli commands somehow hooked into the different "shaky" algorithms. E.g.
for the san_path_err_ algorithm, setting a path to marginal would mean
artificially setting its failure count to a value above the configured
threshold. That way, the manual settings could work togehter with the
automatic detection methods, and could be used for overriding them
in special cases.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
