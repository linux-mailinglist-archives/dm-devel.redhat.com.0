Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 181D320D0F0
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-8Orbcy_BMKuT60l0zr14pw-1; Mon, 29 Jun 2020 14:39:49 -0400
X-MC-Unique: 8Orbcy_BMKuT60l0zr14pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B35804017;
	Mon, 29 Jun 2020 18:39:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EE7A1001268;
	Mon, 29 Jun 2020 18:39:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CF15180B791;
	Mon, 29 Jun 2020 18:39:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TCLTMF001219 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 08:21:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20B35217B434; Mon, 29 Jun 2020 12:21:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 983CA2156A54
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 12:21:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D64DC805C21
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 12:21:24 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-322-BRIcB0MxPkGnYQ_ixH7lKg-1; Mon, 29 Jun 2020 08:21:22 -0400
X-MC-Unique: BRIcB0MxPkGnYQ_ixH7lKg-1
IronPort-SDR: IS2LiAO0SEol4Ije24jnK9IPkYyOCyaAbV99buwZj/n3+xqHevY12PBcmr7lp+wJUGH0R/RxZk
	u9cTIr5CtT3Bc56StvHjV1Oruud6RKoVXe5oK0imgKH4bjMLmUrgWmYP0efUp9w0UlgCx+99ve
	u/sUHwn+bytwgUiCPzl9XbtkCiSnb0UcFo1iI3qfneYr4NWZS34V7OnQDLTpME+/cFhBIVKkEK
	MSmkL9j8Lzi2gDcr78lYdyxuzidAV40dk0VfcJ3GeLHGwqhxCbUM3rpgbC6G5JQswsiLqaSqyV
	Odg=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="145502239"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 20:21:20 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB3808.namprd04.prod.outlook.com
	(2603:10b6:805:48::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Mon, 29 Jun 2020 12:21:18 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 12:21:18 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 07/14] block: merge blkg_lookup_create and
	__blkg_lookup_create
Thread-Index: AQHWTFVFyCAhfw/dRUSuUH/1G+TpHw==
Date: Mon, 29 Jun 2020 12:21:18 +0000
Message-ID: <SN4PR0401MB35989164D23E31992F6750F69B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-8-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f645c3d6-7136-49c2-8a77-08d81c26ed19
x-ms-traffictypediagnostic: SN6PR04MB3808:
x-microsoft-antispam-prvs: <SN6PR04MB380864544A071F7E6B9430F59B6E0@SN6PR04MB3808.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3coz+RRRyb7dFeeqZ39NWuz5Q9C1yHoGdqvAVvwtgh76DTSclOUE7tx3DjF+nwGtYtElzFDNJou+l5yIU8r3+1RsvZmYdq14XGSnaLlPS5uwxyPUQ7zo1asQAeEAkqsK4d4dDhARlZLwZQKW5NHsCB97M8l7WNuvPPCU8Hmj58MqpW8epwTxsK3vBt6YQ3OG5mXcu52pUH0pWo6We7ai954X0LPtcf72oWPo06Y4NWcLNnkK9pPF0yuNrq9rdzmm4JsCpkkY1WvhU7fXnuTbXRO/FXMMqS13UWhHBQHdikkGjDbRoKSZtqyyVBCJJlXzEw4da9UBg1agyQa/JETQsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(33656002)(4326008)(478600001)(66556008)(76116006)(2906002)(66446008)(66946007)(91956017)(316002)(66476007)(7696005)(9686003)(55016002)(64756008)(19618925003)(5660300002)(8676002)(6506007)(4270600006)(8936002)(110136005)(54906003)(52536014)(186003)(558084003)(86362001)(7416002)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: f32qXrTqTxpIGfyoXKIW7tytHNU1smODLqqk1KxP/mPO7Xp5bFX01WOwD3ptOIfkXxeiArEuPQ8wHR+pEXLMbbqCP9rHS6Qw+yXrQhDFd+E2xfB+QgsT3u8BzBQKBfsJ7EWIXcIt3N0PqXlrSajGLEmfeG3TTRm6G3t2KA8byN0vi8OERQ3HvPeGbxjOSDa8UcoVHdNPxxgM1hS4+GF2jO9wVRY3TwQ3UabqRHFTHwG2O9YHIndpQZEJwPNcOGIjZ8HKIwWoa+brG5pYweNr2pI0pmnWegtW2s6++vTa2eK8JYBSW1vPAGdVjomC7HvS1AyrejxV9C3Kqf3+8OcJGyyJuL0h9oUHjokK9ohgo9GB6d45MygAaDHdPlrEt9qA4I8s1JzwOENOF5spHj7dia2s/IpXgXzjLpeZANzOOfiQPcUS+4OOXoQpJYAvDP2UUpeaxjFmtKrmxHcVY+fVjhSkW35RHR/yNw6ZXZFqTq8vJtwkEsSmtNlrt6O/33I6jS1p15qOWkYpD0Eg3HZ38gwhz7w/o9J1YN9xSp8jLSeer3FhLMSgy69h7rJVFWlT
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f645c3d6-7136-49c2-8a77-08d81c26ed19
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 12:21:18.3225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gsa6wn/UOuY8ZT+HImDR6SBKn1T2YzsKFO3K1vX6U895GG5jsHBoo0FYAjfdLO29xhJxp9vxAlMzKovtuBIkRDkqEv5V0qZablQ2b6S61m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3808
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05TCLTMF001219
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 07/14] block: merge blkg_lookup_create and
 __blkg_lookup_create
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

