Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 232C9B194C
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 10:04:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 741BD2D0FB7;
	Fri, 13 Sep 2019 08:04:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5885C219;
	Fri, 13 Sep 2019 08:04:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 531782551C;
	Fri, 13 Sep 2019 08:04:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8D83gcf008139 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 04:03:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 100AB3CCE; Fri, 13 Sep 2019 08:03:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA21519C5B;
	Fri, 13 Sep 2019 08:03:39 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 884BE806A40;
	Fri, 13 Sep 2019 08:03:34 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 13 Sep 2019 08:02:45 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 13 Sep 2019 07:56:15 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 13 Sep 2019 07:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iDMTRtFf6Wp69ZZWStRVAy+JBDjmQ32N3gcpZnHqYs7ZkoilR/jijhqCW4SHQLomLbx8LmdE8KaBUFMHH1V1yd+17ZS2/rvoJMoeqB61m4rpd00CXSAF7+VRlxg77gbr8G3z/Dcg6V7BW1T0bQ5zG/BZztyscmvFc8RWl2Hbvw+LeeYFb86UBqcoQRtFohVsQZC5fyFG18EWYQuXOXJBc7Xw9+dYBi1RwaqqDQzsuzScPdMl5k18KpoatM5cvjXvr1xQrvERaoQWawUV/RYqosR/o0yqWal1MDmJk1fjP1oeXqsb+74cHJdm/oAQhix1U7ikQdIJpzakaHNsZ+blKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=J6EfWSzQAMXRU+QG0mrDObBepLh1Zi2faoiLQtBWIPQ=;
	b=obaYhn+YsP+ZIeUGHLMz2s31Uw2tZSSvunhOYu/SDpogMs1DEpTDGJI6AZPE0pU5xeEGro9kWhQa0HVu9LEos2hHZhBdHkl8+vFQlRD67FewYvfi/vO3hmZ7rayD3/hKhSIkfCs5JWXQZf7R6JEUt/f0DphdMezGsguVHlwsxC5RNzpAEztiJiH31LupVc3uUKNGuT5AciVabwTnSM9l7xsW6aHmPNANKf0rNMeBVwMBc8etpU8CGZkvKLeaRt11QUG0NMcJT+5kBK67tyMRnvnDkY4tqwJ6RBYyloKkCzhzHARN/kk7xEX4cJhyTFO1ufX16/bFGlvZjBofB6Fscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3382.namprd18.prod.outlook.com (10.255.155.221) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2263.21; Fri, 13 Sep 2019 07:56:13 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025%6]) with mapi id 15.20.2241.018;
	Fri, 13 Sep 2019 07:56:13 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 3/4] mpathpersist: fix leaks
Thread-Index: AQHVagi2/kd8bTWEKUqtYZTPrJDoxw==
Date: Fri, 13 Sep 2019 07:56:13 +0000
Message-ID: <cfec1a7ebbe1e62699d26b9978a8643a798c05dd.camel@suse.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
	<1568155161-9343-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568155161-9343-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60ec3d3e-d94b-413d-1e25-08d7381fd936
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3382; 
x-ms-traffictypediagnostic: CH2PR18MB3382:
x-microsoft-antispam-prvs: <CH2PR18MB33820BC1F5781785C551708BFCB30@CH2PR18MB3382.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(199004)(189003)(52314003)(14444005)(256004)(305945005)(66066001)(25786009)(4326008)(7736002)(186003)(2616005)(476003)(2501003)(81156014)(81166006)(8936002)(36756003)(91956017)(110136005)(26005)(76116006)(11346002)(446003)(8676002)(316002)(66476007)(66556008)(64756008)(6506007)(66946007)(99286004)(102836004)(76176011)(71190400001)(71200400001)(66446008)(3846002)(6116002)(6512007)(2906002)(53936002)(6436002)(86362001)(14454004)(5660300002)(6246003)(118296001)(486006)(6486002)(229853002)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3382;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7hhkACIvyo8+HK6xzUuLtavVRHsJEXxYyUCNMm+UQb3sXbBKwVu39qGHWN2u2nqw/5v6iJG0x8PF5A1HqiNDo6J4dbse87vDcrJu7EVg3hCusz6llIcrg1GIAOvi3g7oLoZMKUXGJG5YtiVz39Qmyj/A/FzNTsWshUYtt09vmT6/X/jECwFCVPbkelM/RorVnEEaJ9fmrXOAt7z/e7nCTcU5GKCsJn9/mJDeKWbQmNYYnHyxY2hjEpOMB2SInF+7/kaKwzG1S/JB+/pywFwbkd89h6Kwlh8SPKbHbKlTa3CVessimdNOFHXj4PRgvl9JmGaNDloQPROf+LcSoatbRwtqDkZ3nGUXyp+wGmcNk57Eh/7dxXAA2s4OoX4Lw06xXeN6CSsBkqbsRDD924Z2rTW3nCfGat6MVqzIVuC2swE=
x-ms-exchange-transport-forked: True
Content-ID: <9604C673720C5B4B857DCE77A6DB3E14@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ec3d3e-d94b-413d-1e25-08d7381fd936
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 07:56:13.4339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUsQtGgSS/F6EKvtZE29X+kipNf2LnQd7G3S9flgRjZvDIHgsoC3s6PwwRaJ7rcIywg0jo5lWTBx+9/yPru3lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3382
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Fri, 13 Sep 2019 08:03:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Fri, 13 Sep 2019 08:03:38 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8D83gcf008139
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] mpathpersist: fix leaks
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 13 Sep 2019 08:04:16 +0000 (UTC)

On Tue, 2019-09-10 at 17:39 -0500, Benjamin Marzinski wrote:
> If handle_args() fails while looping through the argument list, it
> needs
> to free batch_fn, if it has been set. Also handle_args() needs to
> make
> sure to free the file descriptor after it has been opened.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  mpathpersist/main.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 


Looking at this code again, I wonder why we don't "goto out" in this
code in the "else if (prin_flag)" case:

		if (0 == num_prin_sa)
		{
			fprintf (stderr,
					" No service action given for Persistent Reserve IN\n");
			ret = MPATH_PR_SYNTAX_ERROR;
		}
		else if (num_prin_sa > 1)
		{
			fprintf (stderr, " Too many service actions given; choose "
					"one only\n");
			ret = MPATH_PR_SYNTAX_ERROR;
		}

At least in the first case, prin_sa would be -1, and trying to continue
looks unhealthy. In the second case, the error message might be treated
as a warning and the second prin action would override the first. I
personally would think that it would be better to assume the user made
a mistake, and do nothing, in this case as well.

Anyway, that's not your patch's fault. So:

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
