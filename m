Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56B8E002
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:37:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E892315C01C;
	Wed, 14 Aug 2019 21:37:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 730AD83799;
	Wed, 14 Aug 2019 21:37:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B448718089C8;
	Wed, 14 Aug 2019 21:37:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELbOdF006615 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:37:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B99640EFB; Wed, 14 Aug 2019 21:37:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EA3119C68;
	Wed, 14 Aug 2019 21:37:21 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03FD725CCB;
	Wed, 14 Aug 2019 21:37:15 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:36:44 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:35:25 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XJ1GlNEhgyUbb8EIaZDX7omwOLahesGoXVnzHbtSEn7v8ta6bilY9kTbhOU3IRCStc2YNc7iorZceP2r2Hc43fUy1aS3fa6UDB4432iWooAyOudRUrvaNeFD3T7qOVGGxSL2i1fFwzFhiIhtrz8sMc1meCgLyMQddsPor+cWw08IjUPf6xvJezifmNvDMk2IpohfBxllhDVczOWT7Mdp+RNoYzTKA6FQzM5iubO6M0/TJioStj6le4ClnIk5tS4wa7otx0dsMaRv8Zt09zKBsoJWJWDfoxOC9/4361LwXqgcRifNXn4bWNo6jZEqnlm1Lz4CBN+cjN6Kzy0n/F4dKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wFmrawD2iOuBmJy68iJMJ13IYn85pveV2RLIc9Hynow=;
	b=ASUgArD7KBkOkmlXiOi2cC37/7Qm0cP2b6AK8MQ6apHIVXoMjuhceH8N2wCEt78j+3wUiPMGZcrnOPCc9YNJi+UIHL3fKup5GJMQv9nnKveWfdgWLCr4wy1/hky0/G6F8CTN5UIDspl2Y73Ie6zEINQSIehTfTKqLuUXOZ63/cUeK/dh4hSzPzbRabt5dwvpNvjEDSjSbc30FpYRzAU61kNhRU4FECFHNne/9rJq/qI3ZZyJ034rjMoakhLCSnsdLd3qbU4VwYnXs2oMFrN2ZXQPkKNZXYz6nc5/63/CBrnAujOYxnfVPpyJ2RPyYgSneLbsiMiSQhDP5RC9Nf6ggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3397.namprd18.prod.outlook.com (52.132.246.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:35:22 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:35:22 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 01/16] libmultipath: make vector_foreach_slot_backwards
	work as expected
Thread-Index: AQHVUugtS+lndWaUNU2F5QxZ8yzohw==
Date: Wed, 14 Aug 2019 21:35:22 +0000
Message-ID: <a9da37ba58b4dca3108d981bc0b0283574d7b2c0.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4aee39d-6453-41e2-f010-08d720ff4fcb
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3397; 
x-ms-traffictypediagnostic: CH2PR18MB3397:
x-microsoft-antispam-prvs: <CH2PR18MB3397FE2BE4D528FE7050F624FCAD0@CH2PR18MB3397.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(199004)(189003)(86362001)(486006)(64756008)(6436002)(36756003)(91956017)(229853002)(66556008)(66476007)(118296001)(5660300002)(66946007)(256004)(8676002)(76116006)(66066001)(66446008)(6486002)(81166006)(4744005)(81156014)(478600001)(99286004)(2501003)(305945005)(76176011)(476003)(316002)(53936002)(54906003)(6512007)(110136005)(446003)(25786009)(102836004)(14454004)(7736002)(26005)(6246003)(71190400001)(71200400001)(2616005)(4326008)(6116002)(186003)(8936002)(2906002)(3846002)(6506007)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3397;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /py9oLGCsvpMS6k3hJpXib7B4pyZh0a3zMOXfYrLIqY7MYO5jAe3kcSYznVF/GdtIDIQ+f1xupYH38YzFOJYa8T6b8JSJC/TUS46m2cs/j+UGq8mmCoWSiSe01i8Gy+Tr1YrwLjfb/vWc2qwwiuzy4dQ5tSUEHtQRTj8JGpWiyTL1Wrd6C5+yPwo/YzjQJ1OftIvxksTL25r/qmdQNtzZg5xbyuJSvI62D9aSIj8e1oQtkc8w4yg7IZA98hA2q097XCkdv4MPr1kiM2h3fMOQMAiV/ZPwx9IcfZkUqmfZxREvEVrN8cTbjQ3c0kS70mGRW4ULnzYBVRP/fdf6z0bfF3dUlec29jxCGhRw/tyLRV2xMq/IcnxGu9AtKYGn+FKuKdEnR3gFRbde501h8JM0uW7xk3aInPMkpJ+rAy12SE=
x-ms-exchange-transport-forked: True
Content-ID: <A4499A0D866C0B41A572BB29E0F15DE4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aee39d-6453-41e2-f010-08d720ff4fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:35:22.2110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qPgjh09YdTW38CdskzpUjyF6deaXmhhlgIBqppoPyulB3poF/yl+7PrSYkZKu944VdubrhdoIM+AvrzPPL2fFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3397
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Wed, 14 Aug 2019 21:37:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 14 Aug 2019 21:37:20 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELbOdF006615
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/16] libmultipath: make
 vector_foreach_slot_backwards work as expected
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 14 Aug 2019 21:37:54 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> All of the code that uses vector_foreach_slot_backwards() treats "i"
> as
> the index of the entry "p", but the way it was coded, that wasn't the
> case. "i" was the number of the entry counting from 1, not 0.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>  (once more :-)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
