Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512E60CEF9
	for <lists+dm-devel@lfdr.de>; Tue, 25 Oct 2022 16:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666708108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uIp+IPNMm1ekS6tzWjCDrViS1I/+f8cNfxGFtPnTQ8Q=;
	b=IAqInwaZP80C9G+NAbbNbntMMrPVUE+g+rsg+whb9Xi1wF5pcd813w3SzmHkTtbnnl1Kbe
	N4upv0ZUgC0Bj3WTN9H1XMH/Bg00tZPC51YBB03xunEpIBcsOL1PyhxlxSt1jhXNGRVDnY
	vBVjDnzzn+oP3e11RBoWs4RHWI6Zu6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-o1hwcd2LPde7jTvM7Jpu_A-1; Tue, 25 Oct 2022 10:28:26 -0400
X-MC-Unique: o1hwcd2LPde7jTvM7Jpu_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D411D185A7A9;
	Tue, 25 Oct 2022 14:28:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED6932166B2A;
	Tue, 25 Oct 2022 14:28:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38C051947054;
	Tue, 25 Oct 2022 14:28:12 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D2021946597
 for <dm-devel@listman.corp.redhat.com>; Tue, 25 Oct 2022 14:28:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F16BF20290AE; Tue, 25 Oct 2022 14:28:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E846A20290A5
 for <dm-devel@redhat.com>; Tue, 25 Oct 2022 14:28:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C33613C0F680
 for <dm-devel@redhat.com>; Tue, 25 Oct 2022 14:28:10 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com
 (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-bQKP2wBnPRC3xVJRArKktQ-1; Tue, 25 Oct 2022 10:28:08 -0400
X-MC-Unique: bQKP2wBnPRC3xVJRArKktQ-1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="68130855"
X-IronPort-AV: E=Sophos;i="5.95,212,1661785200"; d="scan'208";a="68130855"
Received: from mail-os0jpn01lp2110.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.110])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 23:26:58 +0900
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com (2603:1096:604:18::16)
 by TYWPR01MB8823.jpnprd01.prod.outlook.com (2603:1096:400:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 14:26:53 +0000
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::5fa2:ac9e:d081:37f1]) by OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::5fa2:ac9e:d081:37f1%5]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:26:50 +0000
From: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
To: Dave Chinner <david@fromorbit.com>
Thread-Topic: [PATCH] xfs: fail dax mount if reflink is enabled on a partition
Thread-Index: AQHYfA4g5aj+ViA5o0mdS5cU960Zpq1oy6eAgCBSEICAACSLAIALwXoAgAASpQCAB7mIAIABcJ4AgDfaCgCAAYXbgIAHcj8AgAAwlgCAADFJAIAAQWgAgAEpzwCAAQljgIAGUv0AgA+aw4CABj0IgIAAQxUAgADul4CAGN++gIACWZ4AgALenACAAFidVoAAJVqAgAInQ4A=
Date: Tue, 25 Oct 2022 14:26:50 +0000
Message-ID: <dd00529c-d3ef-40e3-9dea-834c5203e3df@fujitsu.com>
References: <e3d51a6b-12e9-2a19-1280-5fd9dd64117c@fujitsu.com>
 <deb54a77-90d3-df44-1880-61cce6e3f670@fujitsu.com>
 <1444b9b5-363a-163c-0513-55d1ea951799@fujitsu.com>
 <Yzt6eWLuX/RTjmjj@magnolia>
 <f196bcab-6aa2-6313-8a7c-f8ab409621b7@fujitsu.com>
 <Yzx64zGt2kTiDYaP@magnolia>
 <6a83a56e-addc-f3c4-2357-9589a49bf582@fujitsu.com>
 <Y1NRNtToQTjs0Dbd@magnolia> <20221023220018.GX3600936@dread.disaster.area>
 <OSBPR01MB2920CA997DDE891C06776279F42E9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
 <20221024053109.GY3600936@dread.disaster.area>
In-Reply-To: <20221024053109.GY3600936@dread.disaster.area>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-10-25T14:26:50.135Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2920:EE_|TYWPR01MB8823:EE_
x-ms-office365-filtering-correlation-id: 2dfe93d6-ae75-4704-a68f-08dab694f50a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 2cf7QUJUzXTvqD5zDYuz2ZdBUBi0Yi2qZdTT4H/ua/n5gm5ovQK5UVaG00Hs/tVHAKjDQhS/0PLja9Lc3p0VMQlwEZXkzUBIn0aeoSUioXVNvuNJrqVyix71frDlAH3PiXiK92UqV9lk3y5s6cC2iX6iK9Dr60ev8LmX5YLAmDC0bSz0hZWE4DKs9/9u8P4P/J817+yG23xvtqqAeG8RBw8fwjw+k5RgO3HP1X63pPDpY0fbOor19LW6pe0SpoWehKG8oE9R39+epTKmZTpm8b2OEMpHMo7pnEjOarNrAvgEWXp935puCH42Do5bOynEu9GHo20GfdeEeZruvSNWDBZPjboAhsXZK2KVdAiI+U/3DYfGOHFawg7bu1iRZEmJnx2ezyGuEq4yehrcGQeuMTjSrpoUdKn9sQIDQKmx+0j1pya3TT+HCVTOIB2o1rdiNkz5ujeT7xvV1uu0Jba/u8MPTRpZRJ57iVgdNQb4i9krzy0IyL4fe+pHAFP+a+YRp0FhXMibW+yBUZmVOr4b1iN50P4coha5WiXRGbHVyPA7LgkUCeWZOdv7pNxCbI/vxP+aJgN7WCgEgkngd2qElrNpM7VfYuDT6SneDgPjaMN7GgXOMQqspUXFIwgo4AiN4rYcslqlOWzUp+ycpeYhX1a02OjqpwJflwDo/d/ocoiVHBxaN+Ue2HJOZlA38S5LR8X4x8hZonuNfoD20lTJ5nci7n8nhdkiNW3+pfbqWScRmF44QIzsF79Ae/15XfmySRssh4QaOxuPUpeLkaxYZWyVOGIyMOQlhW/ivkicrCwEAjNcOoNvo52Hk4yxF2WvEVTfzwWePVjT5xvOb1J4PCQ7/vKryahWGYRpy08lXc4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB2920.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(1590799012)(451199015)(31686004)(2616005)(1580799009)(186003)(2906002)(85182001)(36756003)(86362001)(41300700001)(31696002)(76116006)(4326008)(64756008)(8676002)(66446008)(66556008)(66946007)(6506007)(6512007)(66476007)(26005)(38100700002)(82960400001)(91956017)(71200400001)(83380400001)(54906003)(6916009)(316002)(38070700005)(122000001)(966005)(6486002)(7416002)(5660300002)(8936002)(478600001)(45980500001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?N2o1Q1o4RlM3ZHlrL1BhQ0ZHNW9xNEZjVFk1MndKSkw2NTlSS1pjanZwczV2?=
 =?gb2312?B?NGx1UGs1VGhYNkhWUEVjRElqWWIxNVlRTDBFdjBxWFY0Y2JOS2xtYWxZVk1Q?=
 =?gb2312?B?dWZFZkxHZjdWRDJxb3RLcDNMUnVwLzdNK0VxdWZmSmxpekxHYmVZVHhwMUlw?=
 =?gb2312?B?ektZQmVabXI0YUR5aFp5SUR4NW9NdWZKdmsvc3ZEZ2hpV29nUGlwemJkZ1ll?=
 =?gb2312?B?bmlQMTRleUF0bEUwdXhhbFh3UnBkc20zRFV4NEpxVlM0WXg3ay9Bd0lxSTIz?=
 =?gb2312?B?WHNSd0xPL2N2K0VTWWpVY2NlK0dvdkNReEpwOTBRd3hoTWhRQzA4djd3ck4z?=
 =?gb2312?B?alJhaUJYblViN0ZlQTJBdXBmaG40QTJQSCt1UXlLNTRwSXZkci9vbC9rYTA3?=
 =?gb2312?B?dVAwT1BoMXBtcUVPc0VuVVhScVNjQUhFaUpvMVJqSTVnYXRMZVBLKzRMNll5?=
 =?gb2312?B?Y2s2QUdkWE9INHI0N1BlVzkrdCtnU1VsNzBGMEtqSHQvclA2M0JEeFJ3NWQv?=
 =?gb2312?B?cTV2UEprMlJjN3BmcDBydUloQUl1OWVuTVRuNGF0V29VYzVWblpmd2s1bXRC?=
 =?gb2312?B?OHpjZUdveXZJR3MzL3ZrblN3OWdPTjgzaHhxRG1oMHpLc2NwNjAxbzIxaGVi?=
 =?gb2312?B?bzhTRzh1VWJCVnNzWXZFUWFhRjMwOHc5M200Q01nbGM5Zi9NeEFnRTV1dFpZ?=
 =?gb2312?B?d2F5amlPNy9uR3dBM0VNM3Y3bVdDRzlmWXZuT2dXZ2dUZHpmc01IaEZpeDV0?=
 =?gb2312?B?OWpiZ2xMNk14RllNQWpPMHdVT1ZYL2NmNVhQemxxdXFHOG9FQmg1cm5TazFD?=
 =?gb2312?B?SmxWUHk0aVJjeVZZSkh6VWZydjlTMTdqUFZabWZDalptdkFNQ0pEemhKRnBO?=
 =?gb2312?B?N0J4RWRsdVN5RGlxL0x1Rnh0Y09hOFAzR1QzaGg5TjQ4UzNNSlNleTNwcW1s?=
 =?gb2312?B?NVlpQWpkZHI2SVNIZU1pK21xelg2anNySTh4RmtMOC85c1dtbjZCNFgxQmd4?=
 =?gb2312?B?M2VoRElQb25Odm8wcE1VbzBMb2luQjBSRzBSOEhubkNjY2UrOGJVVlFtdzI0?=
 =?gb2312?B?K1ZNRjNYUjVVRjFhSHpqZ2wvWnRpLzVhYlN1S0MvcjJiV2drVXNSSnNLNWlI?=
 =?gb2312?B?emZFK0YzUmdCU214ZE9pMlk3dEtzTSsrQmVZV3cwQXJyYlpXbzdsamZvd1BO?=
 =?gb2312?B?UWpHWkdrSGRNMGpQTkZSY0g5Nkt1YzdCbTJBVmpKMnZLa3M1ZWw2UHRkdDRp?=
 =?gb2312?B?RmxHbXJ2Um1uYzYydElwWC81WE9Dc2VHSDdrTTNpVzRvNHV4OHFBdEhCWjRZ?=
 =?gb2312?B?TktaaU1OanA0MHUvSXUyZWZmeUVBcVVUZmVpSGYzYU9Oa3YzUTkyUUxHdnNE?=
 =?gb2312?B?WUd0NTdKUER4djlpbXJtc2grSGVMcHhEL0RjMzhOeVgwSWJRYVcwRHJzdXhr?=
 =?gb2312?B?eXVsT1BDUlFzR3k5Z3kwMVAvazZhbkNtR3dha3JNMElCQXZwaHE1amZKanpT?=
 =?gb2312?B?Q29BbFBJTk5QYWRJMkFaRHdmWjd2Y3lwVTdNamp0M2dBUGtsR1NXMVVsNEpr?=
 =?gb2312?B?eUtRTGlSSjE1d3Q4UmxydnVUU24xTUpIQkZ0c1RiVG81cHNyQWxMNkhhYk5I?=
 =?gb2312?B?WFIvNGF6akNPM01mQmNLM2c4QUNBcGpHUkdNUFFYa3IvUjJtbnZQMUVpUlI4?=
 =?gb2312?B?bVFaRGtQMjlhelV4ZEptWU5hRmM3Y3FmRFZncTdueTRpRXgrLzFXcG1kZFZa?=
 =?gb2312?B?M1FralBqK0lhcDNyeCsweGxWUUpLekQxSVdKeW81dld4dkkxakpMa1I2Qjk5?=
 =?gb2312?B?SFZwY3pLcEdIUmlONzhZbndyNmU2VERtRkJmNzI4eWhxaE1TSUczRWhGTDI1?=
 =?gb2312?B?RFQ4cXRWM1haMGFjajhOVGhZY0hkejhieXladlljdnUvSndEc25SaCt1cGJ3?=
 =?gb2312?B?SHI2ZmNyc3ZJRGVIdGpRUWlMWXVHTWx6NVE2ZHZDTW1RQWlHd0x1SXpKSzRR?=
 =?gb2312?B?aFhQNklCU1hrOG50WmlJZERzZmtwb2NZbnFpc1NHdmJKc3Z6YVQ5b3EzaHlr?=
 =?gb2312?B?Nzdac3hhd0gwTm1BVnJFK2JoRDZZa2IwZUpWRS9GM2E3RUM4b1NPbnlRdXJV?=
 =?gb2312?Q?VvCbH2sF02SbN5z2u4E4DQxls?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2920.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfe93d6-ae75-4704-a68f-08dab694f50a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 14:26:50.8408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXKAuRW4GbUjhBspZa6vgG5hUzNh/8tfep/+HWDqBN2gwyQXtYwuN7sbiyBAhDnfR528Dn1uOE+vN688iNl+JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8823
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
 "Darrick J. Wong" <djwong@kernel.org>, Brian Foster <bfoster@redhat.com>,
 "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Yasunori Gotou \(Fujitsu\)" <y-goto@fujitsu.com>,
 Jeff Moyer <jmoyer@redhat.com>, "zwisler@kernel.org" <zwisler@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <5488732A170EC04BADFE95B2AC1FA9DD@jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

CgrU2iAyMDIyLzEwLzI0IDEzOjMxLCBEYXZlIENoaW5uZXIg0LS1wDoKPiBPbiBNb24sIE9jdCAy
NCwgMjAyMiBhdCAwMzoxNzo1MkFNICswMDAwLCBydWFuc3kuZm5zdEBmdWppdHN1LmNvbSB3cm90
ZToKPj4g1NogMjAyMi8xMC8yNCA2OjAwLCBEYXZlIENoaW5uZXIg0LS1wDoKPj4+IE9uIEZyaSwg
T2N0IDIxLCAyMDIyIGF0IDA3OjExOjAyUE0gLTA3MDAsIERhcnJpY2sgSi4gV29uZyB3cm90ZToK
Pj4+PiBPbiBUaHUsIE9jdCAyMCwgMjAyMiBhdCAxMDoxNzo0NVBNICswODAwLCBZYW5nLCBYaWFv
L9HuIM/+IHdyb3RlOgo+Pj4+PiBJbiBhZGRpdGlvbiwgSSBkb24ndCBsaWtlIHlvdXIgaWRlYSBh
Ym91dCB0aGUgdGVzdCBjaGFuZ2UgYmVjYXVzZSBpdCB3aWxsCj4+Pj4+IG1ha2UgZ2VuZXJpYy80
NzAgYmVjb21lIHRoZSBzcGVjaWFsIHRlc3QgZm9yIFhGUy4gRG8geW91IGtub3cgaWYgd2UgY2Fu
IGZpeAo+Pj4+PiB0aGUgaXNzdWUgYnkgY2hhbmdpbmcgdGhlIHRlc3QgaW4gYW5vdGhlciB3YXk/
IGJsa2Rpc2NhcmQgLXogY2FuIGZpeCB0aGUKPj4+Pj4gaXNzdWUgYmVjYXVzZSBpdCBkb2VzIHpl
cm8tZmlsbCByYXRoZXIgdGhhbiBkaXNjYXJkIG9uIHRoZSBibG9jayBkZXZpY2UuCj4+Pj4+IEhv
d2V2ZXIsIGJsa2Rpc2NhcmQgLXogd2lsbCB0YWtlIGEgbG90IG9mIHRpbWUgd2hlbiB0aGUgYmxv
Y2sgZGV2aWNlIGlzCj4+Pj4+IGxhcmdlLgo+Pj4+Cj4+Pj4gV2VsbCB3ZSAvY291bGQvIGp1c3Qg
ZG8gdGhhdCB0b28sIGJ1dCB0aGF0IHdpbGwgc3VjayBpZiB5b3UgaGF2ZSAyVEIgb2YKPj4+PiBw
bWVtLiA7KQo+Pj4+Cj4+Pj4gTWF5YmUgYXMgYW4gYWx0ZXJuYXRpdmUgcGF0aCB3ZSBjb3VsZCBq
dXN0IGNyZWF0ZSBhIHZlcnkgc21hbGwKPj4+PiBmaWxlc3lzdGVtIG9uIHRoZSBwbWVtIGFuZCB0
aGVuIGJsa2Rpc2NhcmQgLXogaXQ/Cj4+Pj4KPj4+PiBUaGF0IHNhaWQgLS0gZG9lcyBwZXJzaXN0
ZW50IG1lbW9yeSBhY3R1YWxseSBoYXZlIGEgZnV0dXJlPyAgSW50ZWwKPj4+PiBzY3V0dGxlZCB0
aGUgZW50aXJlIE9wdGFuZSBwcm9kdWN0LCBjeGwubWVtIHNvdW5kcyBsaWtlIGV4cGFuc2lvbgo+
Pj4+IGNoYXNzaXMgZnVsbCBvZiBEUkFNLCBhbmQgZnNkYXggaXMgaG9ycmlibHkgYnJva2VuIGlu
IDYuMCAod2VpcmQga2VybmVsCj4+Pj4gYXNzZXJ0cyBldmVyeXdoZXJlKSBhbmQgNi4xIChldmVy
eSB0aW1lIEkgcnVuIGZzdGVzdHMgbm93IEkgc2VlIG1hc3NpdmUKPj4+PiBkYXRhIGNvcnJ1cHRp
b24pLgo+Pj4KPj4+IFl1cCwgSSBzZWUgdGhlIHNhbWUgdGhpbmcuIGZzZGF4IHdhcyBhIHRyYWlu
IHdyZWNrIGluIDYuMCAtIGJyb2tlbgo+Pj4gb24gYm90aCBleHQ0IGFuZCBYRlMuIE5vdyB0aGF0
IEkgcnVuIGEgcXVpY2sgY2hlY2sgb24gNi4xLXJjMSwgSQo+Pj4gZG9uJ3QgdGhpbmsgdGhhdCBo
YXMgY2hhbmdlZCBhdCBhbGwgLSBJIHN0aWxsIHNlZSBsb3RzIG9mIGtlcm5lbAo+Pj4gd2Fybmlu
Z3MsIGRhdGEgY29ycnVwdGlvbiBhbmQgIlhGU19JT0NfQ0xPTkVfUkFOR0U6IEludmFsaWQKPj4+
IGFyZ3VtZW50IiBlcnJvcnMuCj4+Cj4+IEZpcnN0bHksIEkgdGhpbmsgdGhlICJYRlNfSU9DX0NM
T05FX1JBTkdFOiBJbnZhbGlkIGFyZ3VtZW50IiBlcnJvciBpcwo+PiBjYXVzZWQgYnkgdGhlIHJl
c3RyaWN0aW9ucyB3aGljaCBwcmV2ZW50IHJlZmxpbmsgd29yayB0b2dldGhlciB3aXRoIERBWDoK
Pj4KPj4gYS4gZnMveGZzL3hmc19pb2N0bC5jOjExNDEKPj4gLyogRG9uJ3QgYWxsb3cgdXMgdG8g
c2V0IERBWCBtb2RlIGZvciBhIHJlZmxpbmtlZCBmaWxlIGZvciBub3cuICovCj4+IGlmICgoZmEt
PmZzeF94ZmxhZ3MgJiBGU19YRkxBR19EQVgpICYmIHhmc19pc19yZWZsaW5rX2lub2RlKGlwKSkK
Pj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Cj4+IGIuIGZzL3hmcy94ZnNfaW9wcy5jOjEx
NzQKPj4gLyogT25seSBzdXBwb3J0ZWQgb24gbm9uLXJlZmxpbmtlZCBmaWxlcy4gKi8KPj4gaWYg
KHhmc19pc19yZWZsaW5rX2lub2RlKGlwKSkKPj4gICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pgo+
PiBUaGVzZSByZXN0cmljdGlvbnMgd2VyZSByZW1vdmVkIGluICJkcm9wIGV4cGVyaW1lbnRhbCB3
YXJuaW5nIiBwYXRjaFsxXS4KPj4gICAgSSB0aGluayB0aGV5IHNob3VsZCBiZSBzZXBhcmF0ZWQg
ZnJvbSB0aGF0IHBhdGNoLgo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgteGZzLzE2NjMyMzQwMDItMTctMS1naXQtc2VuZC1lbWFpbC1ydWFuc3kuZm5zdEBmdWppdHN1
LmNvbS8KPj4KPj4KPj4gU2Vjb25kbHksIGhvdyB0aGUgZGF0YSBjb3JydXB0aW9uIGhhcHBlbmVk
Pwo+IAo+IE5vIGlkZWEgLSBpIm0ganVzdCByZXBvcnRpbmcgdGhhdCBsb3RzIG9mIGZzeCB0ZXN0
cyBmYWlsZWQgd2l0aCBkYXRhCj4gY29ycnVwdGlvbnMuIEkgaGF2ZW4ndCBoYWQgdGltZSB0byBs
b29rIGF0IHdoeSwgSSdtIHN0aWxsIHRyeWluZyB0bwo+IHNvcnQgb3V0IHRoZSBmaXggZm9yIGEg
ZGlmZmVyZW50IGRhdGEgY29ycnVwdGlvbi4uLgo+IAo+PiBPciB3aGljaCBjYXNlIGZhaWxlZD8K
PiAKPiAqbG90cyogb2YgdGhlbSBmYWlsZWQgd2l0aCBrZXJuZWwgd2FybmluZ3Mgd2l0aCByZWZs
aW5rIHR1cm5lZCBvZmY6Cj4gCj4gU0VDVElPTiAgICAgICAtLSB4ZnNfZGF4X25vcmVmbGluawo+
ID09PT09PT09PT09PT09PT09PT09PT09PT0KPiBGYWlsdXJlczogZ2VuZXJpYy8wNTEgZ2VuZXJp
Yy8wNjggZ2VuZXJpYy8wNzUgZ2VuZXJpYy8wODMKPiBnZW5lcmljLzExMiBnZW5lcmljLzEyNyBn
ZW5lcmljLzE5OCBnZW5lcmljLzIzMSBnZW5lcmljLzI0Nwo+IGdlbmVyaWMvMjY5IGdlbmVyaWMv
MjcwIGdlbmVyaWMvMzQwIGdlbmVyaWMvMzQ0IGdlbmVyaWMvMzg4Cj4gZ2VuZXJpYy80NjEgZ2Vu
ZXJpYy80NzEgZ2VuZXJpYy80NzYgZ2VuZXJpYy81MTkgZ2VuZXJpYy81NjEgeGZzLzAxMQo+IHhm
cy8wMTMgeGZzLzA3MyB4ZnMvMjk3IHhmcy8zMDUgeGZzLzUxNyB4ZnMvNTM4Cj4gRmFpbGVkIDI2
IG9mIDEwNzkgdGVzdHMKPiAKPiBBbGwgb2YgdGhvc2UgZXhjZXB0IHhmcy8wNzMgYW5kIGdlbmVy
aWMvNDcxIGFyZSBmYWlsdXJlcyBkdWUgdG8KPiB3YXJuaW5ncyBmb3VuZCBpbiBkbWVzZy4KPiAK
PiBXaXRoIHJlZmxpbmsgZW5hYmxlZCwgSSB0ZXJtaW5hdGVkIHRoZSBydW4gYWZ0ZXIgZy8wNzUs
IGcvMDkxLCBnLzExMgo+IGFuZCBnZW5lcmljLzEyNyByZXBvcnRlZCBmc3ggZGF0YSBjb3JydXB0
aW9ucyBhbmQgZy8wNTEsIGcvMDY4LAo+IGcvMDc1IGFuZCBnLzA4MyBoYWQgcmVwb3J0ZWQga2Vy
bmVsIHdhcm5pbmdzIGluIGRtZXNnLgo+IAo+PiBDb3VsZAo+PiB5b3UgZ2l2ZSBtZSBtb3JlIGlu
Zm8gKHN1Y2ggYXMgbWtmcyBvcHRpb25zLCB4ZnN0ZXN0cyBjb25maWdzKT8KPiAKPiBUaGV5IGFy
ZSBleGFjdGx5IHRoZSBzYW1lIGFzIGxhc3QgdGltZSBJIHJlcG9ydGVkIHRoZXNlIHByb2JsZW1z
Lgo+IAo+IEZvciB0aGUgIm5vIHJlZmxpbmsiIHRlc3QgaXNzdWVzOgo+IAo+IG1rZnMgb3B0aW9u
cyBhcmUgIi1tIHJlZmxpbms9MCxybWFwYnQ9MSIsIG1vdW50IG9wdGlvbnMgIi1vCj4gZGF4PWFs
d2F5cyIgZm9yIGJvdGggZmlsZXN5dGVtcy4gIENvbmZpZyBvdXRwdXQgYXQgc3RhcnQgb2YgdGVz
dAo+IHJ1bjoKPiAKPiBTRUNUSU9OICAgICAgIC0tIHhmc19kYXhfbm9yZWZsaW5rCj4gRlNUWVAg
ICAgICAgICAtLSB4ZnMgKGRlYnVnKQo+IFBMQVRGT1JNICAgICAgLS0gTGludXgveDg2XzY0IHRl
c3QzIDYuMS4wLXJjMS1kZ2MrICMxNjE1IFNNUCBQUkVFTVBUX0RZTkFNSUMgV2VkIE9jdCAxOSAx
MjoyNDoxNiBBRURUIDIwMjIKPiBNS0ZTX09QVElPTlMgIC0tIC1mIC1tIHJlZmxpbms9MCxybWFw
YnQ9MSAvZGV2L3BtZW0xCj4gTU9VTlRfT1BUSU9OUyAtLSAtbyBkYXg9YWx3YXlzIC1vIGNvbnRl
eHQ9c3lzdGVtX3U6b2JqZWN0X3I6cm9vdF90OnMwIC9kZXYvcG1lbTEgL21udC9zY3JhdGNoCj4g
Cj4gcG1lbSBkZXZpY2VzIGFyZSBhIHBhaXIgb2YgZmFrZSA4R0IgcG1lbSByZWdpb25zIHNldCB1
cCBieSBrZXJuZWwKPiBDTEkgdmlhICJtZW1tYXA9OEchMTVHLDhHITI0RyIuIEkgZG9uJ3QgaGF2
ZSBhbnl0aGluZyBzcGVjaWFsIHNldCB1cAo+IC0gdGhlIGtlcm5lbCBjb25maWcgaXMga2VwdCBt
aW5pbWFsIGZvciB0aGVzZSBWTXMgLSBhbmQgdGhlIG9ubHkKPiBrZXJuZWwgZGVidWcgb3B0aW9u
IEkgaGF2ZSB0dXJuZWQgb24gZm9yIHRoZXNlIHNwZWNpZmljIHRlc3QgcnVucyBpcwo+IENPTkZJ
R19YRlNfREVCVUc9eS4KClRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGluZm8uICBCdXQsIGluIG15
IGVudmlyb25tZW50IChhbmQgbXkgCmNvbGxlYWd1ZXMnLCBhbmQgb3VyIHJlYWwgc2VydmVyIHdp
dGggRENQTU0pIHRoZXNlIGZhaWx1cmUgY2FzZXMgKHlvdSAKbWVudGlvbmVkIGFib3ZlLCBpbiBk
YXgrbm9uX3JlZmxpbmsgbW9kZSwgd2l0aCBzYW1lIHRlc3Qgb3B0aW9ucykgY2Fubm90IApyZXBy
b2R1Y2UuCgpIZXJlJ3Mgb3VyIHRlc3QgZW52aXJvbm1lbnQgaW5mbzoKICAtIFJ1YW4ncyBlbnY6
IGZlZG9yYSAzNih2Ni4wLXJjMSkgb24ga3ZtLHBtZW0gMng0RzpmaWxlIGJhY2tlbmRlZAogIC0g
WWFuZydzIGVudjogZmVkb3JhIDM1KHY2LjEtcmMxKSBvbiBrdm0scG1lbSAyeDFHOm1lbW1hcD0x
RyExRywxRyEyRwogIC0gU2VydmVyJ3MgIDogVWJ1bnR1IDIwLjA0KHY2LjAtcmMxKSByZWFsIG1h
Y2hpbmUscG1lbSAyeDRHOnJlYWwgRENQTU0KCihUbyBxdWlja2x5IGNvbmZpcm0gdGhlIGRpZmZl
cmVuY2UsIEkganVzdCByYW4gdGhlIGZhaWxlZCAyNiBjYXNlcyB5b3UgCm1lbnRpb25lZCBhYm92
ZS4pICBFeGNlcHQgZm9yIGdlbmVyaWMvNDcxIGFuZCBnZW5lcmljLzUxOSwgd2hpY2ggZmFpbGVk
IApldmVuIHdoZW4gZGF4IGlzIG9mZiwgdGhlIHJlc3QgcGFzc2VkLgoKCldlIGRvbid0IHdhbnQg
ZnNkYXggdG8gYmUgdHJ1bmVkIG9mZi4gIFJpZ2h0IG5vdywgSSB0aGluayB0aGUgbW9zdCAKaW1w
b3J0YW50IHRoaW5nIGlzIHNvbHZpbmcgdGhlIGZhaWxlZCBjYXNlcyBpbiBkYXgrbm9uX3JlZmxp
bmsgbW9kZS4gClNvLCBmaXJzdGx5LCBJIGhhdmUgdG8gcmVwcm9kdWNlIHRob3NlIGZhaWx1cmVz
LiAgSXMgdGhlcmUgYW55IHRoaW5nIAp3cm9uZyB3aXRoIG15IHRlc3QgZW52aXJvbm1lbnRzPyAg
SSBrb253IHlvdSBhcmUgdXNpbmcgJ21lbW1hcD1YWEchWVlHJyB0byAKc2ltdWxhdGUgcG1lbS4g
IFNvLCAodG8gRGFycmljaykgY291bGQgeW91IHNob3cgbWUgeW91ciBjb25maWcgb2YgZGV2IApl
bnZpcm9ubWVudCBhbmQgdGhlICd0ZXN0Y2xvdWQnKEkgYW0gZ3Vlc3NpbmcgaXQncyBhIHNlcnZl
ciB3aXRoIHJlYWwgCm52ZGltbSBqdXN0IGxpa2Ugb3Vycyk/CgoKKEkganVzdCBmb3VuZCBJIG9u
bHkgdGVzdGVkIG9uIDRHIGFuZCBzbWFsbGVyIHBtZW0gZGV2aWNlLiAgSSdsbCB0cnkgdGhlIAp0
ZXN0IG9uIDhHIHBtZW0pCgo+IAo+IFRIZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgbm9y
ZWZsaW5rIGFuZCByZWZsaW5rIHJ1bnMgaXMgdGhhdCBJCj4gZHJvcCB0aGUgIi1tIHJlZmxpbms9
MCIgbWtmcyBwYXJhbWV0ZXIuIE90aGVyd2lzZSB0aGV5IGFyZSBpZGVudGljYWwKPiBhbmQgdGhl
IGVycm9ycyBJIHJlcG9ydGVkIGFyZSBmcm9tIGJhY2stdG8tYmFjayBmc3Rlc3RzIHJ1bnMgd2l0
aG91dAo+IHJlYm9vdGluZyB0aGUgVk0uLi4uCj4gCj4gLURhdmUuCgoKLS0KVGhhbmtzLApSdWFu
LgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL2xp
c3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVsCg==

