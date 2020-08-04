Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8080823C096
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 22:12:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-7Gv3YjWQOsyApgpO7pd_2g-1; Tue, 04 Aug 2020 16:12:48 -0400
X-MC-Unique: 7Gv3YjWQOsyApgpO7pd_2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14E46801A03;
	Tue,  4 Aug 2020 20:12:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF0EA88D68;
	Tue,  4 Aug 2020 20:12:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F8CE96903;
	Tue,  4 Aug 2020 20:12:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074BR5qb017139 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 07:27:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BF4D2166B28; Tue,  4 Aug 2020 11:27:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75F672157F26
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 11:27:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B64D89CD23
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 11:27:03 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-33B0QkI7OymIKwNlT05sqg-1; Tue, 04 Aug 2020 07:27:00 -0400
X-MC-Unique: 33B0QkI7OymIKwNlT05sqg-1
IronPort-SDR: Regat6NZkolNvItYWV21IJzwRJ1Jmxf6c7jRMZzKwaJ+C2TxYJgMFh1sFdukyqf8sEbFjzLZE1
	aMSixj5CDHpM9TwG771E4+inZT/2OrAVbVm2akFa8J8Ys39YlzoGlZiZEm4NY0LiloLztTyK/+
	fx3U3N2EWZDR7MFKwm5vxwjERN61xGIHleRE+93zkbUDEM2/hSucQqTf1fW7gHGAwUQ7GG0TgB
	KpxgNYT3379LTYfinmMwU5I75o13Hh4b9LRen/b8Aq2REsKzEAV79grYgs6b+B0JxK9nxf0Pol
	Y8I=
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; d="scan'208";a="144101717"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
	by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 19:26:58 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4783.namprd04.prod.outlook.com
	(2603:10b6:805:a5::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20;
	Tue, 4 Aug 2020 11:26:58 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3239.021;
	Tue, 4 Aug 2020 11:26:58 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm: don't call report zones for more than the user
	requested
Thread-Index: AQHWakEnQ7EK6Gzd+EWB5zzIARuZYA==
Date: Tue, 4 Aug 2020 11:26:57 +0000
Message-ID: <SN4PR0401MB3598A9D49399D70697DCEC789B4A0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200804092501.7938-1-johannes.thumshirn@wdc.com>
	<CY4PR04MB3751EB538B7F29FBDBB4EBA4E74A0@CY4PR04MB3751.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 421107f8-bf52-49cb-72e8-08d838694ca7
x-ms-traffictypediagnostic: SN6PR04MB4783:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4783CA51A57E957D67372D509B4A0@SN6PR04MB4783.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oDtbBh7TJcS/ol0er8KOAlTbjS6pju/jcSGTpxc3SEPeJYNqXL6rY64qIo8gn/9dJ8EGKgbEypMWua6SRasnYg74CVc/zM4R70oUGTjMgSSyYMm7FkrSIp+53fTqb7Hy1mBvUMQExV5J3Q4PDYFIuBVVRrxdJUmMg/PfCzEtLS+hPaiU2X78LNr7Fh64oeqML1li6OQ7EbbCev2/S2lZ+FWu9fOsAzAYhDEpOramH+ep7SSDXAct1wZ/dxHOrmA0QVU1g0o1ZYOvujL1ur+0WHJTcXhNEjTQiI+HyMadD+t730zcnYCUHeQLMwgysAoDUPEcDGMkQuXnynZXzXio+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(52536014)(316002)(186003)(7696005)(66556008)(66446008)(4326008)(9686003)(66476007)(64756008)(91956017)(76116006)(66946007)(83380400001)(55016002)(26005)(53546011)(6506007)(2906002)(54906003)(110136005)(5660300002)(478600001)(86362001)(8676002)(33656002)(8936002)(558084003)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 09QB86hFm4gw2hSTJBlRzniiGChQIa6+oHSAsrYmL7zgi9g2QuBRDsDKoG+vqji4ybaMbBNXeCRLl6qB4LInZGh9sGx9uzPk+DAiRTWZh+T65KrqX0CVDB5KbFhFPwyjWRW2A38sTHlAGrUgP6fr78OeodZ4zZJmaBo4WSx7p3jrlhqTFtwCt2DpWU2nELh2WKwNGg+LwVSGd0micVzX9MPei8OsPs9vMvT50mCgRgdlZHCEGOaDH31G1h8gPSPE1G/TPWsubTzMOXve1MUzwWi+A+jpKdRboBZLgb08kTzdfMqUOxeiJTccSmhD9EZsJVabF/88sbp9C0C33L1IU1cVMbaCixu+T5BagXRXOrkkfXGVH+75OxIIUQInEPFj832t+NcXAil2BpXkDEkjSc+MJWJc7hM+SFf6QEfxCTiZtzcY5t1dIlFSHKHIECvc4EoDV9aqZwqSDAFCrjECIAIDJgi00qpgxNNQCDmu6nI6w7LedYIjHNtK/9PSjBevvshi2VzrbyCXKXsqUOhZAwggFSyNmAXi532qT8d6FXvNtR6T8F4zWy82EGIAxwBnqdHqxt8SgVeDfQ5xWgJ56Ph8N32kkG6xO7NoS1ZBH65bq7tgu7V3z95z/uEvsr0m7nVorJAn4ptg1/bVGfOmJA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421107f8-bf52-49cb-72e8-08d838694ca7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 11:26:57.9990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIRrFnym4PtvWpFxqnpNC5vzhd7S9xGcyhX/7TiLCGu0kUQDKIt79Mao/rBXmbHO57sx0m9GqMo+DBfB5xeD/7AuxO2WFA030de3Bv4k7dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4783
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 074BR5qb017139
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 04 Aug 2020 16:11:07 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm: don't call report zones for more than
 the user requested
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04/08/2020 12:17, Damien Le Moal wrote:
> 
> Looks good. I think this needs a Cc: stable.

Indeed, Mike can you add these two when applying or do you want me to resend?

Fixes: d41003513e61 ("block: rework zone reporting")
Cc: stable@vger.kernel.org # v5.5+



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

