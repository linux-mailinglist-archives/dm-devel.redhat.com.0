Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2216F4324
	for <lists+dm-devel@lfdr.de>; Tue,  2 May 2023 13:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683028527;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=71A0PYEpHhsjIzVjE9KePozgRb/3lixP6ykYnHo/ZBo=;
	b=AVqymvIcKloV34q5lX1O6YUCQDbnmenbvpSfG5dxOkPi/rqQS2ivPw2lCdwRSX1GiyVTbN
	qIU0oC6/7uG4kTWn+4Lhu4KyZC6GdmkRck0ux6DC0IR3OQiJACpVFGh3ewzRbIzBlM3kku
	vL1cMmNZ4mS3BiDhXGO8yUdLoFgjXBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-0DWXxdWgNAW-4qMpRG3wrg-1; Tue, 02 May 2023 07:55:26 -0400
X-MC-Unique: 0DWXxdWgNAW-4qMpRG3wrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4726885625;
	Tue,  2 May 2023 11:55:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1EC94020960;
	Tue,  2 May 2023 11:55:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B7CC1946A74;
	Tue,  2 May 2023 11:55:13 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 045921946589
 for <dm-devel@listman.corp.redhat.com>; Tue,  2 May 2023 11:55:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D81382026D25; Tue,  2 May 2023 11:55:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF772026D16
 for <dm-devel@redhat.com>; Tue,  2 May 2023 11:55:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABB203815F6C
 for <dm-devel@redhat.com>; Tue,  2 May 2023 11:55:11 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-IdlVZZqfP1SwtYWpNtBH2g-1; Tue, 02 May 2023 07:55:05 -0400
X-MC-Unique: IdlVZZqfP1SwtYWpNtBH2g-1
X-IronPort-AV: E=Sophos;i="5.99,244,1677513600"; d="scan'208";a="334142206"
Received: from mail-dm6nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2023 19:53:58 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by DM6PR04MB6748.namprd04.prod.outlook.com (2603:10b6:5:247::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 11:53:56 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f%9]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 11:53:56 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Bob Peterson <rpeterso@redhat.com>, "axboe @ kernel . dk" <axboe@kernel.dk>
Thread-Topic: [PATCH v5 09/20] gfs2: use __bio_add_page for adding single page
 to bio
Thread-Index: AQHZfN/ah0SwlMtQ0kSzU0wxjKFb7a9G3voAgAAA0gA=
Date: Tue, 2 May 2023 11:53:56 +0000
Message-ID: <a8a8ee20-7783-e955-aef7-edb5a24aa0ae@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <20230502101934.24901-10-johannes.thumshirn@wdc.com>
 <5f3ddda1-2c7d-811c-ffd5-5fc237def2eb@redhat.com>
In-Reply-To: <5f3ddda1-2c7d-811c-ffd5-5fc237def2eb@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|DM6PR04MB6748:EE_
x-ms-office365-filtering-correlation-id: 00cbf530-5240-486b-99aa-08db4b03e8ec
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: MX2VmU4azCp50HFyOIRsRl/07ncpM7doGZZbvlI2RSE+BCCi9nSoO6uILoFAt5DnKMTh7fvZkwe0AWm+IFw6gWPjS14kyp+TPxdlOtXeEvJJBB23jbsA8gLhGDlEl+r2Ii0uFUhlpGlDdc85DyGZYCNaZuz5AEtgUor5Outgx8+56kWSoYb+BkFh348YWb5LUm/egaUJxFsPWdXaR3xekYc3XroVyy8WskWBdyJ+4hZNpl4zXei2ZZCh0/m1Hh7ZKTm+aoBTZUq4S+FIgk0w9hQhEf4uwvqJczx+WBk/obL+tRRsQUtMh6vxeeFT/rBrYUwDFzgsvcVxqgg7QIXd3neqX28YLiG71nn5I9vUDyWS3xkP4sv+QbUPL3jcm4hPUFAKa38HACY5Kwg9IvR6mjJaI8tBz6worfgH0AIkVsUkp6uPNXDagiR0KiaTXrtCK8SXVodJknIid6k5o9FVn6EIN/BLYjb1839PIf4qbD5t1bJStfbMweb0RRVmEoBc5EgbuX3xHcgzZHVMlKQsUkbL40B0sQLklU93oaB9k5xyhRM6HiQ0/rbXVd9LI2smlR7KvDuF91Mm41uCZsK8ZonXMhIlH8WRjqXIEAnNh8s9PrdjporWVzCI08goQm8q5rp/IqZMJsbRTeJ31zmoCmXdKqiDpdQPJpMx7urFMys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(83380400001)(31686004)(6486002)(71200400001)(7416002)(38070700005)(122000001)(82960400001)(36756003)(53546011)(6512007)(6506007)(2616005)(186003)(66946007)(76116006)(66476007)(64756008)(38100700002)(66556008)(86362001)(41300700001)(4326008)(66446008)(478600001)(91956017)(316002)(2906002)(5660300002)(110136005)(31696002)(54906003)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2hUdHVTOHF0Ukh0MmtIL21UMjdrV1dOdjU0QmVrdFJxa3JvK2dHWXQ4bis2?=
 =?utf-8?B?TG1YR3NVbG5UY1NJQkpIem9TZmd1SHRwZzB4eDNuOFMzYkdOem10NUdxWlA4?=
 =?utf-8?B?SXljaCt2bGY3MlA3d0o3SE02K1dLWWdJM1RFMGNmc3lwSSsybTdrd21wQzFR?=
 =?utf-8?B?eDAxUDloUVZQc0FnTzJvMkxMRW0wcHNPUkxMVG1ZdGNRdWpVcUNiZVBkQnNE?=
 =?utf-8?B?N1pqS0U3NE1NenNpUUMyS1ZLWG0yZ0swejQyOGhkbE5EZUtCRzVpZ1I1cGJB?=
 =?utf-8?B?cWVKT21VMVk5ZFM1YjFBNE5OT1lsQkVOc3ZyYkY1SGtXdXd2SEJ3Z0d6WEJu?=
 =?utf-8?B?QWd1cmZXVjFYL1pXVjNZSUg5RUE2MTEvQ0tkVjhRaG1rcVNpd050WWZ2b0Q4?=
 =?utf-8?B?eFNCVk9PNlhUcXQ5SjB4ZnpzK1dRNVVZTEJXNndWNlR0VEpMNk9DVkVDWE10?=
 =?utf-8?B?RWpONncvaUViVG9DTjVqaTRlT1pwTGdweVVqZzg2eXhCWDErcXFUNEdlRzh3?=
 =?utf-8?B?RzMxN0tUSHErMDNTWklLbFpGbHFkZ1RXWlZYampqNG5rTy9HVGpld3o1RHpt?=
 =?utf-8?B?NkdUWHdnQjY0M050MEVBQXUvSlBuMXlsYTBIdW5aNFk4aDRjWXkwZ2o2QVhw?=
 =?utf-8?B?bkdBaXV5YXRmVGFzSG5abjI4LzkwOUloQysyMi9sM3Uyek5VTGdTMnA5NE5V?=
 =?utf-8?B?WGFoUnlDSmhLS09zbm1uTUNqRWVjYzV1b3o2MUNsbFp2cFptMUFmRzJyNDdv?=
 =?utf-8?B?dmVqRnNRTUh1SVc2YmRmM1hFYVVaNWtVNkphamZONFRpNkJnLzBDTmNPdVBs?=
 =?utf-8?B?M0dJb3ZrSkF0b0ZObUExcWh2Zzg2eVJ0ODd0UFl5TW54dm9XWGtYbUZtdTBG?=
 =?utf-8?B?ekUxaU02SllmZnZnTjBpeDRxMGhKcEJXZEtidHhWUXcxd252bm1TaWNiUzBV?=
 =?utf-8?B?UFlLRGpURzh3V0lqUk5JWm1GM1pKM3ZmQlJXQ01TRGRJVkRwQXVXclJZS045?=
 =?utf-8?B?QVA0NnJqVlpXQUhLREVNbHViall3MTdYOWZDaVo3bU9PSEhrbHN5WWJjM3ph?=
 =?utf-8?B?NmdBS3RVdGhxZkxwWlJGVjVHWFRJZmorVFUraCtObGJyeU95anRlUEl5ZDRk?=
 =?utf-8?B?NDY3NTI3NjQwZHVGR2p3YnE4RjUrUEd0OTVuN1VvY0Q5MUJiVyszRFV5QlRh?=
 =?utf-8?B?eE93MzJMODZPQ2tkTHQzQWlHRktyYlBQTkFUYmVIRUF1SDZXZm9rMW80Um5R?=
 =?utf-8?B?TkZUajQvQjBYQ3JVTDhJQlBFMXJLSGFYREkrVWNvZ3cxbUpVWE0yTUNyVjhY?=
 =?utf-8?B?SGR0dDRmUjIrcE5UNmNHUDFHZWFOYVlMUkt2RzZDQ01HUGxNNnFOaEFESjNP?=
 =?utf-8?B?SHBCK2hkZzJ0bXVVZXN3NHgrN0N0OTM0di9MdmRTMFQ1WHFPaFFiSG1GL3hv?=
 =?utf-8?B?dnRCOHJDaXJLbnZNbzFwb0hGVCtlcTduajdzcDRZOFIrNXNMN0VzSE5ZNWd3?=
 =?utf-8?B?THdrSndDS2Z2RTdsekF1RUhCY1BVWDNRWjNuc25sSFY1N2RiZytYOWVhekl2?=
 =?utf-8?B?em1SMnhEYmUrd0RHWHJORkVUNFBzMCtpZjBRQ2FPaWVaOEtOMXRhR1c0VWtY?=
 =?utf-8?B?L1RTdjljRXZWUGw3QUhYc3pTNEdNZy93Q3ZXZzBzUWQ1VmxLRzAwa2hyNEZw?=
 =?utf-8?B?ZTMvR1g3QUdmc2ZrVzdVc2Nadk41KzViTi8wWHRHdytyZVd2NXZaVENUODQr?=
 =?utf-8?B?NVlKYkpaRVliVDc3cStsM215UDBiVWZmZ2dtWGVCeGZMTmFpeVU5L3BtQmNu?=
 =?utf-8?B?MnlWL0wyc3hqcUhJTHROK3diQ0E4Sk5yeXVQaS8zYkw3V3RvRStOUnl6Skw0?=
 =?utf-8?B?NVZQOEpoaDRtMENxa3I5STNCMitKbFNkY3ZiN25Mc25kTzhNajZQa1grSEx3?=
 =?utf-8?B?RmFyZ3dlZm4zWjFFejN0cGFXazR2M29lUThCbzZaTEFTeE9uSTNxa2tRL3dk?=
 =?utf-8?B?YldYdWNPN0ZUTDBQNzVXNDFtNnNCdWp2WTFzQ0Z2RHpIWUU2Wlk3c3BVMm0y?=
 =?utf-8?B?ZGVrQThoVnBKNzB1TnFkL1c1aThUWmhreHhIRG84T2RydXNxV1BVZDdQb3h1?=
 =?utf-8?B?Wm8yUmhnaVl5RkxKMkxnaFVSQnM0R05Ic0lGVG9jK3ErWHFkUHJtOUN1MVBK?=
 =?utf-8?B?WjNGdW94MkFsQnZENmJBNndYU0U4WUdvd1F6Y1U1Vjh1MFNyeVcxb0ZVVWRm?=
 =?utf-8?B?eFVsQlMrZmJpd0FlSS90dyt6Q293PT0=?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?QXJaMmZ3RWFWbjQvWkxEOWI3TW9MTGtCckFaNDBLMkxiNnp1bWpaNHk2SDVr?=
 =?utf-8?B?aUphZGQrR2hpc2xGclh1MmRBWVp1U04vSW1hT2JvenNTaXhpd1RBRTQ3emhI?=
 =?utf-8?B?TVlEbHpyNFR5TEVwQWJ4SVdmMlhCRVhaK3Bma3A5QjN3YWxtQmoyTDh3OURO?=
 =?utf-8?B?aDB5UlVxWlZBbUppa3ZId1FtclBQckxYNUNmVmRGTEpHVEtFRmdjT3duK1hy?=
 =?utf-8?B?b3Eza29McFRhWkhOZDI2bTI3ditTSTlQemxWZW1rQjZKV3pzYk8rcHVmZENn?=
 =?utf-8?B?ai80a2QyNEtXVUt6OFpQU1gyWndNOWkvRUR6c2J5M05CSHhKODdFY2xyUjdh?=
 =?utf-8?B?TDk5S2Qzcm9HaWJUeENpWFVuODBCT2Z1U1RzWFJybGxsQjVVQVN4L3ZpK2E4?=
 =?utf-8?B?cU5wTEZ1bjByb3lIM3JmUnA3azBucUZ5eGMwbzRYWlJJNGUvaEV2MCswR2NW?=
 =?utf-8?B?NEpNV2xFWE5IVUdueUVYSldrMVdhcFFJc2hMWFFXS0xiSVBjd2F5SlNoMWY4?=
 =?utf-8?B?ZU9zcXJoUmRjclQ2anBQcnpmTDlaYUcweTc1VW5lbmI4cEZsQjNmSUNmZ3Y4?=
 =?utf-8?B?OGZsV2s3WFVpWkVlb2xjckZIdWdVZUZlZ0pzVWNwcU1aQVR1Q1AwR255NTcz?=
 =?utf-8?B?TGk3TWpBbFF6NHdaRnhVbHkwcWxFVU1ha1FiYkhBNG8vZEtmb3RmUzhzRkRJ?=
 =?utf-8?B?MU1RQklnQXlQSHBud2FRNS9FZWUyY2VMdDRxQnFIYkpKNUg0cmdHQXVBdjN3?=
 =?utf-8?B?SW9iS2d2NmFKOThRekpWaTZpaEJWb0ZrK0w5TFJ0UkJ5aU9acjRRUTEzR0FZ?=
 =?utf-8?B?bEpOUi9CQnA4Y283WU9oWk9yeEpPWVkxOFBOZDVtQVV3TFQzYWd2bHpMcG0w?=
 =?utf-8?B?c2dsU2tMZVZadDgvRjczdWhoR1FKNkVKM1YxUzllQUtLemVoS3VUbDNmdHMx?=
 =?utf-8?B?ZnZuWkpJOHh4dUphZFZOUURVM0VIUnhaMnBhSmVRcCtZai9WaEQ5YVNQU2NG?=
 =?utf-8?B?UHlqSlYyLzBsVGIzMEtTY3hDQWU2TDFCdzB6aEowajhJWWR3SXFnY3NkcU4z?=
 =?utf-8?B?ZU5UMjg5QWVYMmlLbDRIZllVK3dpY0lleFNMMDJ1N2ZPblpkS3p4dGU4RzFU?=
 =?utf-8?B?Nmw5ZUtIYlpSTUpRaTY3eFhoR3FzVEVVQ1pOMjd1YXNsNy83OE5zQXVyWmdB?=
 =?utf-8?B?dE00dHVlNm8rU3FpdExPaS8rSGtoUXhSYm1sNDFLbGhFQlNqZ2dWZFMwQVRR?=
 =?utf-8?B?bDI0VHJOUkc5TGRVMEU2OTl4bEtUanJSMlovc3ZUcFJMMjFRRmxSaUhDSTY5?=
 =?utf-8?B?TFkwT3Z2RjlCcGdxNG5iWHFYQ1piNzQ1bU1FOEwzS1N2SzNxSmF3Y2xCcytt?=
 =?utf-8?B?bWx1V0Z1YnBMTE9PTmlWYWJ0SW9nNXNobk5vM2FoVDZVRTh0elBibUdSS3Fv?=
 =?utf-8?Q?gubjguKl?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cbf530-5240-486b-99aa-08db4b03e8ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 11:53:56.7643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aS1eWRQhy2Os/KFc30sguNt2+jURZps93pgn4SF/CvCI8b8nTcGlw/ovLRj9a9/2IllescQlRCXz4W0jLUp7QUT5hUrx/l2Qtu28cq2MDcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6748
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH v5 09/20] gfs2: use __bio_add_page for adding
 single page to bio
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
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, "kch@nvidia.com" <kch@nvidia.com>,
 "agruenba@redhat.com" <agruenba@redhat.com>,
 "shaggy@kernel.org" <shaggy@kernel.org>, "song@kernel.org" <song@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>,
 "willy@infradead.org" <willy@infradead.org>,
 "ming.lei@redhat.com" <ming.lei@redhat.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Language: en-US
Content-ID: <D43DC35A1F2CFE4184421B1C012C98B2@namprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 02.05.23 13:51, Bob Peterson wrote:
> On 5/2/23 6:19 AM, Johannes Thumshirn wrote:
>> The GFS2 superblock reading code uses bio_add_page() to add a page to a
>> newly created bio. bio_add_page() can fail, but the return value is never
>> checked.
>>
>> Use __bio_add_page() as adding a single page to a newly created bio is
>> guaranteed to succeed.
>>
>> This brings us a step closer to marking bio_add_page() as __must_check.
>>
>> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
>> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>> ---
>>   fs/gfs2/ops_fstype.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
>> index 9af9ddb61ca0..cd962985b058 100644
>> --- a/fs/gfs2/ops_fstype.c
>> +++ b/fs/gfs2/ops_fstype.c
>> @@ -254,7 +254,7 @@ static int gfs2_read_super(struct gfs2_sbd *sdp, sector_t sector, int silent)
>>   
>>   	bio = bio_alloc(sb->s_bdev, 1, REQ_OP_READ | REQ_META, GFP_NOFS);
>>   	bio->bi_iter.bi_sector = sector * (sb->s_blocksize >> 9);
>> -	bio_add_page(bio, page, PAGE_SIZE, 0);
>> +	__bio_add_page(bio, page, PAGE_SIZE, 0);
>>   
>>   	bio->bi_end_io = end_bio_io_page;
>>   	bio->bi_private = page;
> Hi Johannes,
> 
> So...I see 6 different calls to bio_add_page() in gfs2.
> Why change this particular bio_add_page() to __bio_add_page() and not 
> the other five?
> 

Hi Bob,

Because all the others check the return value of bio_add_page(), only the
one converted doesn't. But it also doesn't need to as we're using 
__bio_add_page() on a newly created bio.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

