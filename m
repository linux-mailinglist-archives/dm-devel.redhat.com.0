Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5E494949
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jan 2022 09:18:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-sn8D5Kw6O5O6WYpCV5V-Fg-1; Thu, 20 Jan 2022 03:18:31 -0500
X-MC-Unique: sn8D5Kw6O5O6WYpCV5V-Fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06B208519E6;
	Thu, 20 Jan 2022 08:18:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FC5A7D723;
	Thu, 20 Jan 2022 08:18:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6947C1806D2B;
	Thu, 20 Jan 2022 08:18:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IMGC3t030853 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 17:16:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B072492D41; Tue, 18 Jan 2022 22:16:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06472492D19
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 22:16:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E040385A5BA
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 22:16:11 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam08on2078.outbound.protection.outlook.com [40.107.100.78])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-498-Q5bMNXaKNKm35VnBRc1K9w-1; Tue, 18 Jan 2022 17:16:07 -0500
X-MC-Unique: Q5bMNXaKNKm35VnBRc1K9w-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by MWHPR12MB1487.namprd12.prod.outlook.com (2603:10b6:301:3::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12;
	Tue, 18 Jan 2022 22:16:06 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f]) by
	MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f%6]) with mapi id 15.20.4909.007;
	Tue, 18 Jan 2022 22:16:06 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 19/19] block: pass a block_device and opf to bio_reset
Thread-Index: AQHYDDwO0g1B+gUH7U+xTMvaoQ/ZbqxpWYCA
Date: Tue, 18 Jan 2022 22:16:06 +0000
Message-ID: <d7068c68-17f5-86d3-6901-b747d41ac346@nvidia.com>
References: <20220118071952.1243143-1-hch@lst.de>
	<20220118071952.1243143-20-hch@lst.de>
In-Reply-To: <20220118071952.1243143-20-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831e1521-8843-4b6e-2440-08d9dad01f4e
x-ms-traffictypediagnostic: MWHPR12MB1487:EE_
x-microsoft-antispam-prvs: <MWHPR12MB1487185DBB1CA4391C897A0BA3589@MWHPR12MB1487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: WnAebCZtNHiQ63I0CU1rijEJS4dszLTxPk6xkcV4rhmVbrukxa/Tb8aOd2CE0JlslROAS7YaqeuSyjqGTc0ko15/Y4sdtDmgoEY+u1hT3XoPO9Na+ieR9TmG6WcFZxzL4cWfFOSyU8HqhO0iOuwbQfEKblAJAlv+xWyH8U9lrd9P1ohHl5CMiKSv96xA/YdtnPPVUc5DFiWmIOVXTMhp7MQh3NzC3zITr5Jhi5Wrzfsf//HMPWeOIDO2+XTbnfqBhbSA54I5RNq3qS7TwHVRyXw2gvBgu6v3rq22G9Qug8WYH9Sr9AXXoaurcMq4Jdq6YK+HO28XNdjOXcWtC9HjYKEBzZaB1KBy4Rw1rIgZgcT5D0+sb5WZ8ys02UZaUX+9kqYRHpjd1ahBM67asTJbz5cuMRd6UZgHVB5uNk+ksO7iWdZMD4uB+GSiMZxYMIxh72xdcRJXtM7uNfNmNF4WsZWgYgQkv8RZz1yDtKCUqAYweYDb+LMAH3EANEZDWuscx7yU+bKGRV98VgvOsHKLXBzum5E+lafv5o+SC0DHSVsGtSjwyghN+68ViCO4QYcgzbTxtyRbKc5zyaSArWijyxEB9ZGDsMTXMWjm74ys03s8U5Wg13f+9YDUwvzdRtLebTbvZ6Vec3Z/X9ppLNMsvDtir6TspLwf1i/mCsHcySCU92JyRY2RJwDE6bVa/90zkNHYllAWa/OAqXh3xysI/wM+l0yfMjYmvvqRt94Ru4TFon/xGA8E+2buYTbwVHXQINl9QPze5cQsxB1e1NaLGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(186003)(31686004)(6486002)(316002)(66446008)(64756008)(66556008)(83380400001)(54906003)(6512007)(2906002)(66946007)(110136005)(66476007)(38100700002)(71200400001)(2616005)(86362001)(7416002)(36756003)(31696002)(5660300002)(4744005)(53546011)(6506007)(8676002)(91956017)(508600001)(38070700005)(122000001)(4326008)(76116006)(8936002)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFI1TlhHSFJiRVh6Q2RXK3ozRUhZdUdLL05aK3lhclBRREQvQzFEZjZHU2xN?=
	=?utf-8?B?YUUyQUVjMnJMNGFWWm1YcU5EOEVPVTdocVZLN3VRVWFoRk5SMCtCQXFWSFh4?=
	=?utf-8?B?ZG5ocEtFUWdUV2czT3dhU3VBN2lDeERwZ0RXMEErR0Y0VVA1bUNkUzY2UDVi?=
	=?utf-8?B?WFdOUWVuYWVVMlB6T0J4azBZTVU4Unl1WTBOaDJvVjdGSVZCMUVYN1FnSUVa?=
	=?utf-8?B?NEw5c2haU055Q0VsbWxpZnFJWHZMMjR2VlZDcXBIYW12cnhaSFhSbmNpQmZN?=
	=?utf-8?B?R3NNSGJTeklocXpJS3M2RTRFeXVZeDN2RUZ2MTRkank0ZVorYW9HY2x4Q0RO?=
	=?utf-8?B?NDhkZEprWS9FbktOejJIUkFxWnAwQnFiejdGcVlqZ1dsWENFb0MvRmtkY24v?=
	=?utf-8?B?RnZsTUpsNUdHQU1kMmtlb05SbVd5ZTVKYVpjaFBna1RVR2E4dThrdEswWXpB?=
	=?utf-8?B?ZTdiTmFrRHl4Wmd4SnIremFqeVlLenZ6NjlieWlocUVwTStoa0s0YzhJaXhL?=
	=?utf-8?B?VzE1eU9mbDZucTYvUGpkNmx5L1ZwSXpuRDBIdWxYL0VxSlo1Zi81NU95Sk5j?=
	=?utf-8?B?NlFNbjZPaEN5bFpIQUN5WEZVZXRsM3pXeERtYzI3cG4ydDQ1K0NML0hsVGN3?=
	=?utf-8?B?aFRWWUhqRSttZStQYkw1MGRiSHRicjVOWjladUR3NmlTM05wL1lQeEhoVFpz?=
	=?utf-8?B?S1dUUThHVVF3MGxMMk51M3VhRHdybG1YNm9WeDh4aWxsT1o4a1cvRTROeE5D?=
	=?utf-8?B?N2VObENRRkpTZnhzc0N3WHNSdFJndkdQc3BHTEM4TWhqbzB1RTF5bENkYnZD?=
	=?utf-8?B?dStzUmZXMFFVMVJtaGNPSWM4SXhkUEFYRjI4ZzNKQnNPdVl0elpwb0N4WU8r?=
	=?utf-8?B?T3U0L1J0QmZKeHZKckgwbHB0bm9zTzNpN2ZXdExGcUYzOEJEVHZlbDBlYXFK?=
	=?utf-8?B?aHAzZnJtc2NneXM1VmxURFZFWmZsMFJDUENqa3VtMTgrbmRjZkg4a1BrQzZE?=
	=?utf-8?B?MU1lZUtrcHZtT0RJNXd0YVNOb1hsN1dibnpWUXlFVEZwN25pZ1o2ZEF1OVYx?=
	=?utf-8?B?NjljMmtoQWF6T3lISjVpREU4czFNdm9vTjJGK0RYVDdTY0QvRXh4YU5VS1pU?=
	=?utf-8?B?WUpISHFwdFhmeEE0MytLQUZJVEJ0czJTc2UxVUI2UmphdG1rM3J0am9PbGVw?=
	=?utf-8?B?THdtQ3hEUGYwNDZ6SjlTcndQbDYzZ3k3UGx6dnJ2endheDRPUW5PZW1Gc21H?=
	=?utf-8?B?SE5VUEszZXZxbHhjTGgycHlHeVJJcjg1U3hjUUk5OWVnbUIxRTZ6bWxMTGlL?=
	=?utf-8?B?a1NkV2F6a0gzOXI0Y1MzYlgxY0l3MUdzYkN0emtEbWJFYTJaRlNPQWRRb2RM?=
	=?utf-8?B?K0RjYStNdXluR1BGZ3VkYVErNXZzVkx1VVRVeEF3bTY5aDdTQVVoTlMxZDVP?=
	=?utf-8?B?dmRMcXpBaHlYOUkwZW1sa1k5OFd4U1lvUDVxMWxDbDRrMFJ0VHQrdVpyRE1H?=
	=?utf-8?B?T3hTLzhUeXRjY0oveVB2enowL2srQW1JTnQ5cXRNeldqWDRCLzRmMWpRYVh5?=
	=?utf-8?B?alBSbFZjL2Vob3Zkc3RMNUVZVFZpTGk0cWRRc1YrRC8veU82Mm1MRnJUZ2R5?=
	=?utf-8?B?UUZHS3VGQmtaVnQvODM3ZEg5amplb2NMVk1SRzVSTkhkRCtNTWgwN0VOem9v?=
	=?utf-8?B?K1h0KzhzYkpDZEhiQU1HZVJobFpMV2tqaE1hQmllTlEzTVdxQmhSL2VHUDhk?=
	=?utf-8?B?U2JpMkIvdHhlRWJkSkZuZ1VRTndGRkVDYTNrVUlnbjJpSDAwcGtTeUNwVzlC?=
	=?utf-8?B?NndVTUhQbHRiY3NGVDdxQjRXbnVIUkxVTWhCVjZNSnVmVzljc1NKTDFlcFdt?=
	=?utf-8?B?U0RnczZrWlJxRXZ0eXQyY3g1MVIvOWJ2dnBGSjU1Z2tnS1RhNlhjQkN0Y3Vt?=
	=?utf-8?B?V0kzSTdUa0lmVjZXejUxd2poTWxXOEVyVStiZUgrRjJwaDJsZ0tnZDJWVkUy?=
	=?utf-8?B?c0VqcDJLbldvaGQxL3QxWDFhYmQrTFBiK091SmRaSjZ1NzRXbjJtVXltcS91?=
	=?utf-8?B?c2dOdUhubkZaYmloQVJCNDIyZW9UUXZjU1BCME5Kd0cwSExaT0EzbVN5Qk1C?=
	=?utf-8?B?MTZRZGRXb1FqQmo5dngzUEZ6bW8yM3ZnZWJKWGU1S0NkTU9penA1ekRZRnRF?=
	=?utf-8?Q?Oqh76GcaHS+12mx+bmYaJ8dR+eb5USyGg2vkJEV/4cmY?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831e1521-8843-4b6e-2440-08d9dad01f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 22:16:06.2434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhgqUXrvNb/Sk3JfwAVTJ2HFQSrGiEXMY8570UQk/nK1iWw/uj3cd57rMnrBNW+w2qyHg7y8hRgCPDtNgxG41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1487
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20IMGC3t030853
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Jan 2022 03:16:10 -0500
Cc: Lars, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ellenberg <lars.ellenberg@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Komarov <almaz.alexandrovich@paragon-software.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.co>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>, Jack,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Morton <akpm@linux-foundation.org>, Konstantin,
	Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [dm-devel] [PATCH 19/19] block: pass a block_device and opf to
	bio_reset
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <CB5A6D32F2CA9E46A3FB208AE3C086E5@namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/17/22 11:19 PM, Christoph Hellwig wrote:
> Pass the block_device that we plan to use this bio for and the
> operation to bio_reset to optimize the assigment.  A NULL block_device
> can be passed, both for the passthrough case on a raw request_queue and
> to temporarily avoid refactoring some nasty code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

