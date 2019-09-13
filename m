Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3376B28AC
	for <lists+dm-devel@lfdr.de>; Sat, 14 Sep 2019 00:51:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27616811A9;
	Fri, 13 Sep 2019 22:51:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0AEB194B9;
	Fri, 13 Sep 2019 22:51:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 459E94A486;
	Fri, 13 Sep 2019 22:51:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DMn68A001681 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 18:49:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93E175D9CD; Fri, 13 Sep 2019 22:49:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4548A5D9C3;
	Fri, 13 Sep 2019 22:49:04 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 798EE18CB8EF;
	Fri, 13 Sep 2019 22:48:58 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 13 Sep 2019 22:47:59 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 13 Sep 2019 22:48:28 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 13 Sep 2019 22:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=exEB4JHpF8abOwW8Fr11DczpH0GJZZNr3L1R7c8E5CNPqNx+xIt7OfBzzHW9YNBDqnn54nYnXKHPRWikrAs8xMh+zvspySCHdvFE7KQqr6X7Rxshv6/Ng+qGnCTGYrZyQVibfF0B2UojtM/DnBQs8/8FJEx/EWFvcATGs9b9KIBckTTRwPB8j5veNGJPGoZEXVpRUuU7mQZNzWnuGR9I5XF+usdg2q6hQduAxBTmKjD//ZAUDkEkbw4nxC343giGsXXreu1xjLzdTv7Jdlde4MKoY089yuARFdZziQ2sKl9hnHbyHwQeT1F9jLzKrH+hDEHXJCJs11Ng7uQKyKnpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9qugZKsOrUiJCVfpYyzwafUA3W/sWBDjHpbRDWFXNoY=;
	b=L73lK4yBqYxPB1KwQrgNjE0+fpsomP09WU+/gw5jUqW1qGlku1csO4Lyb773JiUSBb9bmB2+UCP5OL2suseE3p4LM7/1jPaIDR3NfDxSP35zmCTHS6FI5x6u4eCIDhuH7aZ7i27zLAwERVX92PPTowGOkAmtoPAJYy+xSL0PCNwl8B/pF5n3MERA8uMAQ9B2YlZnm1rba3EnYyXaShHhwNotjegNsXie2/tYyKYR63UocFO+Xrg2NbWL0/Oe2DoPuQHFXskH6B80Ay598AqJuWwunrFMqGh5jLSzPOqeIYzZeZh2wCVgY/mcwlyRPmhLlbHqjv1OKnjAFXGD0Ao5YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3111.namprd18.prod.outlook.com (52.132.246.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.15; Fri, 13 Sep 2019 22:48:21 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025%6]) with mapi id 15.20.2241.018;
	Fri, 13 Sep 2019 22:48:21 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 0/4] misc multipath patches
Thread-Index: AQHVaoVXJzFcV9XkC0WJYxR3hKei3w==
Date: Fri, 13 Sep 2019 22:48:21 +0000
Message-ID: <c0e38dc7cbcf8f676868447828632cd7aadbfc96.camel@suse.com>
References: <1568412244-23982-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568412244-23982-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c22b6233-fc0d-450b-ead3-08d7389c7a80
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3111; 
x-ms-traffictypediagnostic: CH2PR18MB3111:
x-microsoft-antispam-prvs: <CH2PR18MB3111A5F0756BD0B93694B609FCB30@CH2PR18MB3111.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(199004)(189003)(86362001)(316002)(2906002)(3846002)(6116002)(110136005)(66066001)(229853002)(25786009)(256004)(6486002)(66946007)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(71200400001)(5660300002)(71190400001)(305945005)(7736002)(81166006)(8676002)(6436002)(8936002)(36756003)(4744005)(4326008)(6246003)(14454004)(53936002)(476003)(2616005)(11346002)(446003)(486006)(6506007)(2501003)(6512007)(118296001)(76176011)(186003)(26005)(99286004)(102836004)(478600001)(81156014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3111;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1kvKbkubECBj7hqjSfmVG94KZXmfdOfwshSm4A7OknGDRwhbRogvkVJdSEQSp3/i7C1d7kbieIyNTCu3tWpwia89jglY3iFOXdtIIk7Ih54iokZnEpr2AfVFnBkl56AxxUlHh431DnNvRIH9OaUl+djH7OhQQPgpriQ8+PEcyiZ+xn+fNXD9+gKDeQesjQG1CMokol7PdDBl3NMzP6Zaog1ituAQhwl5Oy214AWFuGFm4k/aQFrAxh5Wl+bS4hWiIgd3Ko89g+kK3Xb5bv5Y+8/mPDkUlh0ZD9hkb/3f8GI53i+1hqG4C+/wo2HP09gIYEGHYG7bkpOC1lOm8fiPCGHV3vFBoIOAdDK1wlhTUL5dV0t/fj5olO7lgxWF3a0kFJXu/d0vl+SLvDjCwtWTFQlyo8rF7tZmIeq02gpjs18=
x-ms-exchange-transport-forked: True
Content-ID: <B228C6E1BB4D9F40961461E389ECBE6A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c22b6233-fc0d-450b-ead3-08d7389c7a80
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 22:48:21.5578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWgP7gJifW3ss/9UKZ5xWjauYEixvp2IHIf//S9hkp9DZ/Pchtt4W0/z7kOfqtnc7/zngaSBALS+iWhebF9E1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3111
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.63]); Fri, 13 Sep 2019 22:49:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Fri, 13 Sep 2019 22:49:03 +0000 (UTC) for IP:'15.124.2.86'
	DOMAIN:'m4a0040g.houston.softwaregrp.com'
	HELO:'m4a0040g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.86
	m4a0040g.houston.softwaregrp.com 15.124.2.86
	m4a0040g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8DMn68A001681
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/4] misc multipath patches
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 13 Sep 2019 22:51:29 +0000 (UTC)

On Fri, 2019-09-13 at 17:04 -0500, Benjamin Marzinski wrote:
> These are a couple of disconnected multipath patches.
> 
> Changes in v2:
> 
> 0003: As Martin suggested, fail immediately on wrong number of prin
>       actions.
> 
> 0004: mp_init now is an optional symbol for checker DSOs, and is
> ignored
>       if it's missing, again at Martin's suggestion.
> 
> Benjamin Marzinski (4):
>   mpathpersist: remove broken/unused code
>   libmultipath: EMC PowerMax NVMe device config
>   mpathpersist: fix leaks
>   libmultipath: fix mpcontext initialization
> 
>  libmpathpersist/mpath_persist.c      | 16 ++++----------
>  libmultipath/checkers.c              | 27 +++++++++++++++++++++--
>  libmultipath/checkers.h              |  1 +
>  libmultipath/checkers/emc_clariion.c |  7 ++++++
>  libmultipath/discovery.c             |  2 ++
>  libmultipath/hwtable.c               |  6 +++++
>  mpathpersist/main.c                  | 33 ++++++++++++++++++------
> ----
>  7 files changed, 67 insertions(+), 25 deletions(-)
> 

For this v2 series:

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
