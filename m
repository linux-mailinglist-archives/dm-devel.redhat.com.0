Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FC6098A6
	for <lists+dm-devel@lfdr.de>; Mon, 24 Oct 2022 05:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666581562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hrj7bTHgxJKmZDnjf80juMcl0t7CZNaoGJ3rZd5UkKk=;
	b=JHUg8phJ9NpDn+B39IXOipjMWLFR9MZRaKLHG4a1PFtpvC+03TuA/wyBekEVsVaEliPjhI
	TfPJuJ5yq5tngnwjPvBKkMJk0I71YAEVpRYs58XKD+HaUhYAzCq+tYZvJyb1rI7uhNIQDf
	kT8P/jhIEEjSLx9I9BubWiqfjVIROJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-e1ojJLgJMp-htirz1TVktw-1; Sun, 23 Oct 2022 23:19:17 -0400
X-MC-Unique: e1ojJLgJMp-htirz1TVktw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7FA5185A792;
	Mon, 24 Oct 2022 03:19:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD4EAC15BA4;
	Mon, 24 Oct 2022 03:19:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C90C41946587;
	Mon, 24 Oct 2022 03:19:08 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 982681946587
 for <dm-devel@listman.corp.redhat.com>; Mon, 24 Oct 2022 03:19:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C94542222; Mon, 24 Oct 2022 03:19:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 838AE39DB3
 for <dm-devel@redhat.com>; Mon, 24 Oct 2022 03:19:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DF82185A7AB
 for <dm-devel@redhat.com>; Mon, 24 Oct 2022 03:19:07 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-Zf6RZ2cwPAKkof5NwnL44w-1; Sun, 23 Oct 2022 23:19:04 -0400
X-MC-Unique: Zf6RZ2cwPAKkof5NwnL44w-1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="76436605"
X-IronPort-AV: E=Sophos;i="5.95,207,1661785200"; d="scan'208";a="76436605"
Received: from mail-os0jpn01lp2113.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.113])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 12:17:56 +0900
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com (2603:1096:604:18::16)
 by OS0PR01MB5666.jpnprd01.prod.outlook.com (2603:1096:604:bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 24 Oct
 2022 03:17:52 +0000
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::5fa2:ac9e:d081:37f1]) by OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::5fa2:ac9e:d081:37f1%5]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 03:17:52 +0000
From: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
To: Dave Chinner <david@fromorbit.com>, "Darrick J. Wong" <djwong@kernel.org>
Thread-Topic: [PATCH] xfs: fail dax mount if reflink is enabled on a partition
Thread-Index: AQHYfA4g5aj+ViA5o0mdS5cU960Zpq1oy6eAgCBSEICAACSLAIALwXoAgAASpQCAB7mIAIABcJ4AgDfaCgCAAYXbgIAHcj8AgAAwlgCAADFJAIAAQWgAgAEpzwCAAQljgIAGUv0AgA+aw4CABj0IgIAAQxUAgADul4CAGN++gIACWZ4AgALenACAAFidVg==
Date: Mon, 24 Oct 2022 03:17:52 +0000
Message-ID: <OSBPR01MB2920CA997DDE891C06776279F42E9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
References: <YyIBMJzmbZsUBHpy@magnolia>
 <a6e7f4eb-0664-bbe8-98d2-f8386b226113@fujitsu.com>
 <e3d51a6b-12e9-2a19-1280-5fd9dd64117c@fujitsu.com>
 <deb54a77-90d3-df44-1880-61cce6e3f670@fujitsu.com>
 <1444b9b5-363a-163c-0513-55d1ea951799@fujitsu.com>
 <Yzt6eWLuX/RTjmjj@magnolia>
 <f196bcab-6aa2-6313-8a7c-f8ab409621b7@fujitsu.com>
 <Yzx64zGt2kTiDYaP@magnolia>
 <6a83a56e-addc-f3c4-2357-9589a49bf582@fujitsu.com>
 <Y1NRNtToQTjs0Dbd@magnolia> <20221023220018.GX3600936@dread.disaster.area>
In-Reply-To: <20221023220018.GX3600936@dread.disaster.area>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-10-24T03:17:51.121Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2920:EE_|OS0PR01MB5666:EE_
x-ms-office365-filtering-correlation-id: f97b8e65-b375-4794-aa18-08dab56e5612
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: aYZ3sBdsT00sJn+nBJ6EoWtelBX3TZzsV/QEBWMeoLuvtEYVM9XVyiPXsvDuC25iVQt4I5ixjdqEHOYD2HQi/xGrEVf1gj0UJ5oDKqwR1g2BIE9Gz8iIManRLkmzaBa5phVt56L9FCbx7loZ9FoGZcqBi5BnzvPpdQZwPP2ZCEcnA/jQRncB/moE71Bprd24KHgmOEcKKWTj+SQMta1gxt0JwgT50MK/8OajmExCrcclpWXxTHL3Zd8VJYiNXpr32wVA8WVSGgI3DFpo2iPSkbsGnHksGeIGRDCbJjoX3X5v1GJWy9sqdaSQ2UfePX4KHyW2lupZ3o58JKS+N5YgG1fPyyesVmpPeVvxDmgNTTXMfyandX5VJ/XOdw8TuUWQTLjQPfVqXUlbfQ+I9PTbTW+6UN/Jms7ouJmRwWI+9oFZwb/r+kb2Ckb/p2fbaQaXOdsAUYKN0jAIIeF5sgDiQwJOi+RjU23EQouf16ZuLn8yxBndX8x1eOFHCEKzOZBQhnQmSI4sOZNEIspL07qry1qeP5Z4cs30pKfhluaK94obrZEMA0q2esXnJpXMrgwnhYfyDp6cyGkX5fPx7CvQYm1aahGW7QYWFyc8wVYCjZzCekyS8y/0Pnz+DZ3MWn1SUZyO8K05RVnBx8GCtfC9hxerJQ/eywlw52kTIld63AaxDiqWzIhpWxyOXRYKqSOQbKn711Jw634nB5NdzLSRxq7yYVDTrmA4m7FWw+XNuZnrnSOolCBcPPBIySLgtASD/nSemkWivXNjoVkzrKORANVlxL3wq4VFNNPLZpW41zGLrN0ixH5ffEwxRJKw1D9n
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB2920.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(1590799012)(966005)(122000001)(38070700005)(478600001)(1580799009)(45080400002)(82960400001)(66899015)(38100700002)(66476007)(66446008)(186003)(66946007)(6506007)(71200400001)(110136005)(8676002)(54906003)(76116006)(66556008)(91956017)(4326008)(64756008)(85182001)(7416002)(2906002)(8936002)(26005)(33656002)(9686003)(83380400001)(316002)(55016003)(5660300002)(7696005)(52536014)(86362001)(41300700001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?WXRlWjFXSGNoYW5tbWJ4b1ZIK2JGWitaWTBxTnp2b0lNRWJYZTlvMEVmTEFF?=
 =?gb2312?B?Ynl5emJaaEppa0NFZnBQc0x6UzRNdXFnMTVJckE0MDV1dEJocG9CRldvUElw?=
 =?gb2312?B?ZzNyMWg1K1IrWE5MZm9QV3crNGJGeVRZbC9XZjVLQU1oYnRoNHVyL2wyYm0v?=
 =?gb2312?B?M1l1UVk3WXdDeENCcldhNkczSkQ3K3QvcndubW15QkNOQ1lrN1dvZERDRjFk?=
 =?gb2312?B?UHVIajU1V3MvVlo3bDE5NjZjNEJJSFM0SkZVdWVualRCd29YNnJjRjBxLzFn?=
 =?gb2312?B?VjBDTS84MUNEZVF4WVFIbTN5ZlgvRnRVMUpYUnVlK2ZRYzZ1dEpWdUIvY0Qx?=
 =?gb2312?B?V2JsL005T1Q5bUtEQkJxUmdHNTZqbkQzcXRXd1ovcWpSWW14MHZZOEc2Qlhy?=
 =?gb2312?B?aDRFai9taUUzUnZmTmtZbGxvMlRmWGxsajlqSHZyVnl3eWZKVUd2NWlGN0tZ?=
 =?gb2312?B?NTZXaXV4alk1V2NWQTZtb3pEN0Y2K3l1Rm92Szhtb3p2VFZ2c1JENVZzbVRQ?=
 =?gb2312?B?ZkFEZlJRWjdWUHk1ZjFSY24yRG42Q1dYV2hHNFJYR2IzeFNMLy9Ja01ac0pL?=
 =?gb2312?B?N2laQUltSVFoMXVFNmNHNmE1cU9HTWxodXNNa3h4SW5HTUY4Wmp3bVhHTk5U?=
 =?gb2312?B?aFNFMlpmSktwUVNUVjNIbjJxcVl3Wnh1RWYvbkVyaVlzdmlOUEEvWllTN0p0?=
 =?gb2312?B?Yzg0dXJwSEVOVUtpejRYK0tEblFJWGhRTkcyUm92Z2tLSlRFUGF2Wk9TLzJl?=
 =?gb2312?B?WStlRDlOa0dVd2NHbGtpeFQwbzhFMHNQUGZ2dnRNNUlvYU4zQ2FEQnVNRUFB?=
 =?gb2312?B?eTNvMFQrNVNVeWNZcDVwRkR3Y200NERPZ3NXcnNmVjNlQnV4bG1GME9XNXNT?=
 =?gb2312?B?S0NUVDJJcVlFanZYNVp4Z2VCWER3TCsrQXErUXRWMVQvM0dLWFdKNE5Fclls?=
 =?gb2312?B?RnphdnhhUDBTZFNFMDJkaDBhdUhFcC9qRVlNYUZSUWlodVlQRXdoQTRMeTVR?=
 =?gb2312?B?M1ovOUdHeWJaeEZUaTkyU3k4WHFKejZGM3MyRmNaUkZRakM2Q1o2QTZJT3Ev?=
 =?gb2312?B?QU8yNlF4bzFWYTNWS3hFVFlrQTUrcjFCVk94WXcxcVY0Yk9sTmc1ZW1ZbVJM?=
 =?gb2312?B?dXN2dlIrYmFIVG5yUUF6NkFTYzFYUFYrL1NvVkRkWEpXbTdWanBFMnlnckNx?=
 =?gb2312?B?emxUcUpLWnA4MTRyRDR1QlF4NVN1Qk4xeC83Zk1TclpJREhDR0dFQWhoV2Zj?=
 =?gb2312?B?S1JzQkp3YU44bXJIdEo2RG5JbFYvbEdITnk4K0RpdUFiOWh4Zy9NaVh5NXlr?=
 =?gb2312?B?eFJjYUQ4dnh2Y3RPckdXbVd6VWpSYmQrN1NUdU1vZUJFQWtyVnUrajZINWpq?=
 =?gb2312?B?QjU4UXFUWloya0pGVzJiajEya3lIUVdSTzgzR3B4MmUvUTJxOERxSE9QK3hQ?=
 =?gb2312?B?VzNqY3dNSGl2VHFvVWhkYkppUUZJLzhRVHdqTVRoNktRTHRPSk00MkIyRkdG?=
 =?gb2312?B?UUVMcDhySjk4UXlZVmZyaXlQcDQvTGdTWnJCRmZTRXFXUWFzbndnckNzU0sy?=
 =?gb2312?B?UXVjVkVjcnBtU0kxWTNhZ0wzSzRDSnNGbGprZkQxaEVxWThhWGIvOUFrWnBn?=
 =?gb2312?B?M1dOSlU1ME5uZGtjWDRjWW5uVWRzcUZiekZMNzFlWlVRM0tMZVRIWEZFMGl4?=
 =?gb2312?B?MC90OFFvZ0JnNlRGeTBCTHNxWUMxRlJKS0ovQkx1UkJmTnJHdExXeVA2b216?=
 =?gb2312?B?NTdTWWFkS1YyeEUyWm5DYXdVL0lORnNqK0ZDdUFNQXBOcnpFME5CVW95UkRI?=
 =?gb2312?B?QW9sdlViUm9IU1o5dHZsOGYrbHV4b3lBQmppaWhsandPeDFCM2lyVzJmbC9p?=
 =?gb2312?B?V0ZabnkyTG1CKzFtVFd3cVlHbjhlbGNtQjZkdzYzZWV4VmRlTEUwV2NHYVFH?=
 =?gb2312?B?MU9FcEY0NkVWNTFRNlZPNTlLNXRiV2dRRDlyU05OVVZ0aWRsenpGUnd5aEQ1?=
 =?gb2312?B?a3dtNHNxZDMybkNBUlBQdzY1dURMMFl6dkx1UVpHeHdZY2piR2RJUWZRaU5U?=
 =?gb2312?B?cHAyRWhUMGk4T0o3MTVSdHMwcndpL1JTVmtlSDEra0wya1BOazczMWYvUzRB?=
 =?gb2312?Q?lD5qYLZxE568zbjBXS6ndZhgV?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2920.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97b8e65-b375-4794-aa18-08dab56e5612
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 03:17:52.1284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Pr861oL07cR+SEzUhSUi/UepIJLGrYZ/h+VfGtxzznX+oI1nyK6iUjeCsiZlFAtI1X7zowi94oLOB4uIa29Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5666
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH] xfs: fail dax mount if reflink is enabled on
 a partition
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "hch@infradead.org" <hch@infradead.org>,
 "toshi.kani@hpe.com" <toshi.kani@hpe.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 Brian Foster <bfoster@redhat.com>,
 "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Yasunori Gotou \(Fujitsu\)" <y-goto@fujitsu.com>,
 Jeff Moyer <jmoyer@redhat.com>, "zwisler@kernel.org" <zwisler@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

1NogMjAyMi8xMC8yNCA2OjAwLCBEYXZlIENoaW5uZXIg0LS1wDoKPiBPbiBGcmksIE9jdCAyMSwg
MjAyMiBhdCAwNzoxMTowMlBNIC0wNzAwLCBEYXJyaWNrIEouIFdvbmcgd3JvdGU6Cj4+IE9uIFRo
dSwgT2N0IDIwLCAyMDIyIGF0IDEwOjE3OjQ1UE0gKzA4MDAsIFlhbmcsIFhpYW8v0e4gz/4gd3Jv
dGU6Cj4+PiBJbiBhZGRpdGlvbiwgSSBkb24ndCBsaWtlIHlvdXIgaWRlYSBhYm91dCB0aGUgdGVz
dCBjaGFuZ2UgYmVjYXVzZSBpdCB3aWxsCj4+PiBtYWtlIGdlbmVyaWMvNDcwIGJlY29tZSB0aGUg
c3BlY2lhbCB0ZXN0IGZvciBYRlMuIERvIHlvdSBrbm93IGlmIHdlIGNhbiBmaXgKPj4+IHRoZSBp
c3N1ZSBieSBjaGFuZ2luZyB0aGUgdGVzdCBpbiBhbm90aGVyIHdheT8gYmxrZGlzY2FyZCAteiBj
YW4gZml4IHRoZQo+Pj4gaXNzdWUgYmVjYXVzZSBpdCBkb2VzIHplcm8tZmlsbCByYXRoZXIgdGhh
biBkaXNjYXJkIG9uIHRoZSBibG9jayBkZXZpY2UuCj4+PiBIb3dldmVyLCBibGtkaXNjYXJkIC16
IHdpbGwgdGFrZSBhIGxvdCBvZiB0aW1lIHdoZW4gdGhlIGJsb2NrIGRldmljZSBpcwo+Pj4gbGFy
Z2UuCj4+Cj4+IFdlbGwgd2UgL2NvdWxkLyBqdXN0IGRvIHRoYXQgdG9vLCBidXQgdGhhdCB3aWxs
IHN1Y2sgaWYgeW91IGhhdmUgMlRCIG9mCj4+IHBtZW0uIDspCj4+Cj4+IE1heWJlIGFzIGFuIGFs
dGVybmF0aXZlIHBhdGggd2UgY291bGQganVzdCBjcmVhdGUgYSB2ZXJ5IHNtYWxsCj4+IGZpbGVz
eXN0ZW0gb24gdGhlIHBtZW0gYW5kIHRoZW4gYmxrZGlzY2FyZCAteiBpdD8KPj4KPj4gVGhhdCBz
YWlkIC0tIGRvZXMgcGVyc2lzdGVudCBtZW1vcnkgYWN0dWFsbHkgaGF2ZSBhIGZ1dHVyZT8gIElu
dGVsCj4+IHNjdXR0bGVkIHRoZSBlbnRpcmUgT3B0YW5lIHByb2R1Y3QsIGN4bC5tZW0gc291bmRz
IGxpa2UgZXhwYW5zaW9uCj4+IGNoYXNzaXMgZnVsbCBvZiBEUkFNLCBhbmQgZnNkYXggaXMgaG9y
cmlibHkgYnJva2VuIGluIDYuMCAod2VpcmQga2VybmVsCj4+IGFzc2VydHMgZXZlcnl3aGVyZSkg
YW5kIDYuMSAoZXZlcnkgdGltZSBJIHJ1biBmc3Rlc3RzIG5vdyBJIHNlZSBtYXNzaXZlCj4+IGRh
dGEgY29ycnVwdGlvbikuCj4KPiBZdXAsIEkgc2VlIHRoZSBzYW1lIHRoaW5nLiBmc2RheCB3YXMg
YSB0cmFpbiB3cmVjayBpbiA2LjAgLSBicm9rZW4KPiBvbiBib3RoIGV4dDQgYW5kIFhGUy4gTm93
IHRoYXQgSSBydW4gYSBxdWljayBjaGVjayBvbiA2LjEtcmMxLCBJCj4gZG9uJ3QgdGhpbmsgdGhh
dCBoYXMgY2hhbmdlZCBhdCBhbGwgLSBJIHN0aWxsIHNlZSBsb3RzIG9mIGtlcm5lbAo+IHdhcm5p
bmdzLCBkYXRhIGNvcnJ1cHRpb24gYW5kICJYRlNfSU9DX0NMT05FX1JBTkdFOiBJbnZhbGlkCj4g
YXJndW1lbnQiIGVycm9ycy4KCkZpcnN0bHksIEkgdGhpbmsgdGhlICJYRlNfSU9DX0NMT05FX1JB
TkdFOiBJbnZhbGlkIGFyZ3VtZW50IiBlcnJvciBpcwpjYXVzZWQgYnkgdGhlIHJlc3RyaWN0aW9u
cyB3aGljaCBwcmV2ZW50IHJlZmxpbmsgd29yayB0b2dldGhlciB3aXRoIERBWDoKCmEuIGZzL3hm
cy94ZnNfaW9jdGwuYzoxMTQxCi8qIERvbid0IGFsbG93IHVzIHRvIHNldCBEQVggbW9kZSBmb3Ig
YSByZWZsaW5rZWQgZmlsZSBmb3Igbm93LiAqLwppZiAoKGZhLT5mc3hfeGZsYWdzICYgRlNfWEZM
QUdfREFYKSAmJiB4ZnNfaXNfcmVmbGlua19pbm9kZShpcCkpCiAgICAgICAgcmV0dXJuIC1FSU5W
QUw7CgpiLiBmcy94ZnMveGZzX2lvcHMuYzoxMTc0Ci8qIE9ubHkgc3VwcG9ydGVkIG9uIG5vbi1y
ZWZsaW5rZWQgZmlsZXMuICovCmlmICh4ZnNfaXNfcmVmbGlua19pbm9kZShpcCkpCiAgICAgICAg
cmV0dXJuIGZhbHNlOwoKVGhlc2UgcmVzdHJpY3Rpb25zIHdlcmUgcmVtb3ZlZCBpbiAiZHJvcCBl
eHBlcmltZW50YWwgd2FybmluZyIgcGF0Y2hbMV0uCiAgSSB0aGluayB0aGV5IHNob3VsZCBiZSBz
ZXBhcmF0ZWQgZnJvbSB0aGF0IHBhdGNoLgoKWzFdCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXhmcy8xNjYzMjM0MDAyLTE3LTEtZ2l0LXNlbmQtZW1haWwtcnVhbnN5LmZuc3RAZnVqaXRz
dS5jb20vCgoKU2Vjb25kbHksIGhvdyB0aGUgZGF0YSBjb3JydXB0aW9uIGhhcHBlbmVkPyBPciB3
aGljaCBjYXNlIGZhaWxlZD8gIENvdWxkCnlvdSBnaXZlIG1lIG1vcmUgaW5mbyAoc3VjaCBhcyBt
a2ZzIG9wdGlvbnMsIHhmc3Rlc3RzIGNvbmZpZ3MpPwoKPgo+IElmIEkgdHVybiBvZmYgcmVmbGlu
aywgdGhlbiBpbnN0ZWFkIG9mIGRhdGEgY29ycnVwdGlvbiBJIGdldCBrZXJuZWwKPiB3YXJuaW5n
cyBsaWtlIHRoaXMgZnJvbSBmc3ggYW5kIGZzc3RyZXNzIHdvcmtsb2FkczoKPgo+IFs0MTU0Nzgu
NTU4NDI2XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiBbNDE1NDc4LjU2
MDU0OF0gV0FSTklORzogQ1BVOiAxMiBQSUQ6IDE1MTUyNjAgYXQgZnMvZGF4LmM6MzgwIGRheF9p
bnNlcnRfZW50cnkrMHgyYTUvMHgzMjAKPiBbNDE1NDc4LjU2NDAyOF0gTW9kdWxlcyBsaW5rZWQg
aW46Cj4gWzQxNTQ3OC41NjU0ODhdIENQVTogMTIgUElEOiAxNTE1MjYwIENvbW06IGZzeCBUYWlu
dGVkOiBHICAgICAgICBXIDYuMS4wLXJjMS1kZ2MrICMxNjE1Cj4gWzQxNTQ3OC41NjkyMjFdIEhh
cmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9T
IDEuMTUuMC0xIDA0LzAxLzIwMTQKPiBbNDE1NDc4LjU3Mjg3Nl0gUklQOiAwMDEwOmRheF9pbnNl
cnRfZW50cnkrMHgyYTUvMHgzMjAKPiBbNDE1NDc4LjU3NDk4MF0gQ29kZTogMDggNDggODMgYzQg
MzAgNWIgNWQgNDEgNWMgNDEgNWQgNDEgNWUgNDEgNWYgYzMgNDggOGIgNTggMjAgNDggOGQgNTMg
MDEgZTkgNjUgZmYgZmYgZmYgNDggOGIgNTggMjAgNDggOGQgNTMgMDEgZTkgNTAgZmYgZmYgZmYg
PDBmPiAwYiBlOSA3MCBmZiBmZiBmZiAzMSBmNiA0YyA4OSBlNyBlOCBkYSBlZSBhNyAwMCBlYiBh
NCA0OCA4MSBlNgo+IFs0MTU0NzguNTgyNzQwXSBSU1A6IDAwMDA6ZmZmZmM5MDAwMjg2N2I3MCBF
RkxBR1M6IDAwMDEwMDAyCj4gWzQxNTQ3OC41ODQ3MzBdIFJBWDogZmZmZmVhMDAwZjBkMDgwMCBS
Qlg6IDAwMDAwMDAwMDAwMDAwMDEgUkNYOiAwMDAwMDAwMDAwMDAwMDAxCj4gWzQxNTQ3OC41ODc0
ODddIFJEWDogZmZmZmVhMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwM2EgUkRJOiBmZmZm
ZWEwMDBmMGQwODQwCj4gWzQxNTQ3OC41OTAxMjJdIFJCUDogMDAwMDAwMDAwMDAwMDAxMSBSMDg6
IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwCj4gWzQxNTQ3OC41OTIzODBd
IFIxMDogZmZmZjg4ODgwMGRjOWMxOCBSMTE6IDAwMDAwMDAwMDAwMDAwMDEgUjEyOiBmZmZmYzkw
MDAyODY3YzU4Cj4gWzQxNTQ3OC41OTQ4NjVdIFIxMzogZmZmZjg4ODgwMGRjOWMxOCBSMTQ6IGZm
ZmZjOTAwMDI4NjdlMTggUjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gWzQxNTQ3OC41OTY5ODNdIEZT
OiAgMDAwMDdmZDcxOWZhMmI4MCgwMDAwKSBHUzpmZmZmODg4ODNlYzAwMDAwKDAwMDApIGtubEdT
OjAwMDAwMDAwMDAwMDAwMDAKPiBbNDE1NDc4LjU5OTM2NF0gQ1M6ICAwMDEwIERTOiAwMDAwIEVT
OiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+IFs0MTU0NzguNjAwOTA1XSBDUjI6IDAwMDA3
ZmQ3MWExYWQ2NDAgQ1IzOiAwMDAwMDAwNWNmMjQxMDA2IENSNDogMDAwMDAwMDAwMDA2MGVlMAo+
IFs0MTU0NzguNjAyODgzXSBDYWxsIFRyYWNlOgo+IFs0MTU0NzguNjAzNTk4XSAgPFRBU0s+Cj4g
WzQxNTQ3OC42MDQyMjldICBkYXhfZmF1bHRfaXRlcisweDI0MC8weDYwMAo+IFs0MTU0NzguNjA1
NDEwXSAgZGF4X2lvbWFwX3B0ZV9mYXVsdCsweDE5Yy8weDNkMAo+IFs0MTU0NzguNjA2NzA2XSAg
X194ZnNfZmlsZW1hcF9mYXVsdCsweDFkZC8weDJiMAo+IFs0MTU0NzguNjA3NzQ0XSAgX19kb19m
YXVsdCsweDJlLzB4MWQwCj4gWzQxNTQ3OC42MDg1ODddICBfX2hhbmRsZV9tbV9mYXVsdCsweGNl
Yy8weDE3YjAKPiBbNDE1NDc4LjYwOTU5M10gIGhhbmRsZV9tbV9mYXVsdCsweGQwLzB4MmEwCj4g
WzQxNTQ3OC42MTA1MTddICBleGNfcGFnZV9mYXVsdCsweDFkOS8weDgxMAo+IFs0MTU0NzguNjEx
Mzk4XSAgYXNtX2V4Y19wYWdlX2ZhdWx0KzB4MjIvMHgzMAo+IFs0MTU0NzguNjEyMzExXSBSSVA6
IDAwMzM6MHg3ZmQ3MWEwNGI5YmEKPiBbNDE1NDc4LjYxMzE2OF0gQ29kZTogNGQgMjkgYzEgNGMg
MjkgYzIgNDggM2IgMTUgZGIgOTUgMTEgMDAgMGYgODcgYWYgMDAgMDAgMDAgMGYgMTAgMDEgMGYg
MTAgNDkgZjAgMGYgMTAgNTEgZTAgMGYgMTAgNTkgZDAgNDggODMgZTkgNDAgNDggODMgZWEgNDAg
PDQxPiAwZiAyOSAwMSA0MSAwZiAyOSA0OSBmMCA0MSAwZiAyOSA1MSBlMCA0MSAwZiAyOSA1OSBk
MCA0OSA4MyBlOQo+IFs0MTU0NzguNjE3MDgzXSBSU1A6IDAwMmI6MDAwMDdmZmNmMjc3YmUxOCBF
RkxBR1M6IDAwMDEwMjA2Cj4gWzQxNTQ3OC42MTgyMTNdIFJBWDogMDAwMDdmZDcxYTFhM2ZjNSBS
Qlg6IDAwMDAwMDAwMDAwMDBmYzUgUkNYOiAwMDAwN2ZkNzE5ZjVhNjEwCj4gWzQxNTQ3OC42MTk4
NTRdIFJEWDogMDAwMDAwMDAwMDAwOTY0YiBSU0k6IDAwMDA3ZmQ3MTlmNTBmZDUgUkRJOiAwMDAw
N2ZkNzFhMWEzZmM1Cj4gWzQxNTQ3OC42MjEyODZdIFJCUDogMDAwMDAwMDAwMDAzMGZjNSBSMDg6
IDAwMDAwMDAwMDAwMDAwMGUgUjA5OiAwMDAwN2ZkNzFhMWFkNjQwCj4gWzQxNTQ3OC42MjI3MzBd
IFIxMDogMDAwMDAwMDAwMDAwMDAwMSBSMTE6IDAwMDA3ZmQ3MWExYWQ2NGUgUjEyOiAwMDAwMDAw
MDAwMDA5Njk5Cj4gWzQxNTQ3OC42MjQxNjRdIFIxMzogMDAwMDAwMDAwMDAwYTY1ZSBSMTQ6IDAw
MDA3ZmQ3MWExYTMwMDAgUjE1OiAwMDAwMDAwMDAwMDAwMDAxCj4gWzQxNTQ3OC42MjU2MDBdICA8
L1RBU0s+Cj4gWzQxNTQ3OC42MjYwODddIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAg
XS0tLQo+Cj4gRXZlbiBnZW5lcmljLzI0NyBpcyBnZW5lcmF0aW5nIGEgd2FybmluZyBsaWtlIHRo
aXMgZnJvbSB4ZnNfaW8sCj4gd2hpY2ggaXMgYSBtbWFwIHZzIERJTyByYWNlci4gR2l2ZW4gdGhh
dCBESU8gZG9lc24ndCBleGlzdCBmb3IKPiBmc2RheCwgdGhpcyB0ZXN0IHR1cm5zIGludG8ganVz
dCBhIG5vcm1hbCB3cml0ZSgpIHZzIG1tYXAoKSByYWNlci4KPgo+IEdpdmVuIHRoZXNlIGFyZSB0
aGUgc2FtZSBmc2RheCBpbmZyYXN0cnVjdHVyZSBmYWlsdXJlcyB0aGF0IEkKPiByZXBvcnRlZCBm
b3IgNi4wLCBpdCBpcyBhbHNvIGxpa2VseSB0aGF0IGV4dDQgaXMgc3RpbGwgdGhyb3dpbmcKPiB0
aGVtLiBJT1dzLCB3aGF0ZXZlciBnb3QgYnJva2UgaW4gdGhlIDYuMCBjeWNsZSB3YXNuJ3QgZml4
ZWQgaW4gdGhlCj4gNi4xIGN5Y2xlLgoKU3RpbGwgd29ya2luZyBvbiBpdC4uLgoKPgo+PiBGcmFu
a2x5IGF0IHRoaXMgcG9pbnQgSSdtIHRlbXB0ZWQganVzdCB0byB0dXJuIG9mIGZzZGF4IHN1cHBv
cnQgZm9yIFhGUwo+PiBmb3IgdGhlIDYuMSBMVFMgYmVjYXVzZSBJIGRvbid0IGhhdmUgdGltZSB0
byBmaXggaXQuCj4KPiAvbWUgc2hydWdzCj4KPiBCYWNrcG9ydGluZyBmaXhlcyAod2hlbmV2ZXIg
dGhleSBjb21lIGFsb25nKSBpcyBhIHByb2JsZW0gZm9yIHRoZQo+IExUUyBrZXJuZWwgbWFpbnRh
aW5lciB0byBkZWFsIHdpdGgsIG5vdCB0aGUgdXBzdHJlYW0gbWFpbnRhaW5lci4KPgo+IElNTywg
dGhlIGlzc3VlIHJpZ2h0IG5vdyBpcyB0aGF0IHRoZSBEQVggbWFpbnRhaW5lcnMgc2VlbSB0byBo
YXZlCj4gbGl0dGxlIGludGVyZXN0IGluIGVuc3VyaW5nIHRoYXQgdGhlIEZTREFYIGluZnJhc3Ry
dWN0dXJlIGFjdHVhbGx5Cj4gd29ya3MgY29ycmVjdGx5LiBJZiBhbnl0aGluZywgdGhleSBzZWVt
IHRvIHdhbnQgdG8gbWFrZSB0aGluZ3MKPiBoYXJkZXIgZm9yIGJsb2NrIGJhc2VkIGZpbGVzeXN0
ZW1zIHRvIHVzZSBwbWVtIGRldmljZXMgYW5kIGhlbmNlCj4gRlNEQVguIGUuZy4gdGhlIGRpcmVj
dGlvbiBvZiB0aGUgREFYIGNvcmUgYXdheSBmcm9tIGJsb2NrIGludGVyZmFjZXMKPiB0aGF0IGZp
bGVzeXN0ZW1zIG5lZWQgZm9yIHRoZWlyIHVzZXJzcGFjZSB0b29scyB0byBtYW5hZ2UgdGhlCj4g
c3RvcmFnZS4KPgo+IEF0IHdoYXQgcG9pbnQgZG8gd2Ugc2ltcGx5IHNheSAidGhlIGV4cGVyaW1l
bnQgZmFpbGVkLCBGU0RBWCBpcwo+IGRlYWQiIGFuZCByZW1vdmUgaXQgZnJvbSBYRlMgYWx0b2dl
dGhlcj8KCkknbGwgaHVycnkgdXAgYW5kIHRyeSBteSBiZXN0IHRvIHNvbHZlIHRoZXNlIHByb2Js
ZW1zLgoKCi0tClRoYW5rcywKUnVhbi4KCj4KPiBDaGVlcnMsCj4KPiBEYXZlLgotLQpkbS1kZXZl
bCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVsCg==

