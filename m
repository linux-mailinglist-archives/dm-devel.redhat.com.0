Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A749493A
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jan 2022 09:17:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-FTO3OSedOn63bg_sljvEFg-1; Thu, 20 Jan 2022 03:16:55 -0500
X-MC-Unique: FTO3OSedOn63bg_sljvEFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EA0D46862;
	Thu, 20 Jan 2022 08:16:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC83B60C2D;
	Thu, 20 Jan 2022 08:16:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A27E51809C88;
	Thu, 20 Jan 2022 08:16:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IMANPk030562 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 17:10:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 15DA24047281; Tue, 18 Jan 2022 22:10:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 112D14047272
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 22:10:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBCAE800B29
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 22:10:22 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-553-Wlo8yPMkM6qFu9mIW0PV1Q-1; Tue, 18 Jan 2022 17:10:21 -0500
X-MC-Unique: Wlo8yPMkM6qFu9mIW0PV1Q-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by MW2PR12MB2379.namprd12.prod.outlook.com (2603:10b6:907:9::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7;
	Tue, 18 Jan 2022 22:10:17 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f]) by
	MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f%6]) with mapi id 15.20.4909.007;
	Tue, 18 Jan 2022 22:10:17 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 13/19] block: move blk_next_bio to bio.c
Thread-Index: AQHYDDwIi23zfbZWP02cbOp5v0GjmqxpV+AA
Date: Tue, 18 Jan 2022 22:10:17 +0000
Message-ID: <898045a2-19a4-15ba-a352-ce1767f17cac@nvidia.com>
References: <20220118071952.1243143-1-hch@lst.de>
	<20220118071952.1243143-14-hch@lst.de>
In-Reply-To: <20220118071952.1243143-14-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3621004d-42ef-40d2-624d-08d9dacf4f4e
x-ms-traffictypediagnostic: MW2PR12MB2379:EE_
x-microsoft-antispam-prvs: <MW2PR12MB237997490FA666B9FF821D5FA3589@MW2PR12MB2379.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: s02X2IWbX4rKx8KySN+biMpWmkIFrCBJBvbfdvBsF2wiHI8e/5CB5IcNgwc6amdCF73sviR5k5KMr5Z4ll36fqJXTZU0hQfniPWiPeJfPbUgJdSJjJljUVThr74/33qayKtzM9+PGtJILtW+BdTvO4LamCTArcZVsBX0We3rJHMdN9QAyYxr0NUquqlgQq3a2M8e/kWZ9DFGMrtlHZ/Mgiroqb2XS4Z3E62A0OyL73LPNMqfX8HX5UaT7t+nBjBqJ0RLeAoueglXtTwNx9NDUR9tDSMo2j+aNwZjGWblJmD4GhCvWSDcoST19IcyvTRqppgaPX+LIu0X4NVJTk/4FkFhfd6s4eXt6lpfioAyjapjwAyuCZ3YulUfmFVsDxBkUq4GACtJUZyz2soaPKPSdB7yx6gLRFel/IUa16h3tztRHZlRf2uCsVRqIjr9qYipvuNKA4vd88L4013HJIBT66SIhQ/3uFuntGqtSIraDJkOownNEfXzd/G4WQ01byRy5KThFSqsW3ePI2hQ2MONg2RE82RfI0IodeyQeBt3SDxb6+43DVAHZ4IMH62eSWkwyF/RgBii/4drf+CQOhohzGsv6uYT+alaTO4prvKQewa0+DX9qFazy4NpWgajuuYuKxrI/4JVDMS/xyZhgBIYO0azX8tp9dq3JlDMy23Z/wzQhLVPR7zTyg1NCwBL4cHWyOXpH1jqGXYDPehWmsKMva7i65WuVcYCey8vtnqToQzTulI1kEIgocmmp2s+Faa/sM9z+8rolOUFWd0mwWOnLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(122000001)(38100700002)(558084003)(36756003)(54906003)(8936002)(91956017)(71200400001)(8676002)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(31686004)(316002)(186003)(86362001)(53546011)(6506007)(4326008)(6486002)(110136005)(2906002)(5660300002)(2616005)(38070700005)(7416002)(31696002)(6512007)(508600001)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUZ6YmhENUNEd0hLU3BzWlhWYmJlVm5YamdCNDBrNDNJcUlyZ3hDMnlRcUJN?=
	=?utf-8?B?bEZtMEZqMlduNy9VUVJHKzBLa3Y3dlN0QXFJTFl0VUtrZURQZWJ5OHNHMlg4?=
	=?utf-8?B?b1lsVnBVQVczTG8wT2pYUVhzOXdxeUphNnZEZGpZVFcxY2lZN08zR05UMmlV?=
	=?utf-8?B?ZTFjV2x1eEc3QnJVcDlsSWhQYnhkTis0T1EzWTgxc2hkWFBxSUtFV2F2MzZr?=
	=?utf-8?B?aTFWbm52NmNmZ05SRUh2RXQ4clZiemFObnVQTW9Td290ZElsVDNraThOSE1r?=
	=?utf-8?B?TW5PM1FtYklna29GTENDcjJYdDFuNWlNNXJuU241TFdFNWpMMCsxRE5FZklm?=
	=?utf-8?B?ZncxaDRkankwWFhnT2N3ZC85VlNqN29HM3pwZElvQyszV3UxTFVTKytncVA3?=
	=?utf-8?B?Q24vaFVQa3RkOUx2TmxBUXJVa3Z0bVVLKzNUSzJOUmpPUS9WTlQzUHRDYUdL?=
	=?utf-8?B?OFZmTnJGM1pIRjQxZS9yY2g4djNiYlBuRWZ2elVZeWxLdElGU1o4ZER3c0ZP?=
	=?utf-8?B?b1ViM0ltWkFRaHRtR3FEWkNTdGFpQ3JBRW9FdDkwcXN6R1ZGK01XdWs2S0Ra?=
	=?utf-8?B?OWFXNWw2bDBkNG93ZlpwWVJlNjY2WWxlUXFnWFhXUDRaRDNNUzVpbmdMd2Zy?=
	=?utf-8?B?RGlZc2ZHSjJGRDltVldJY2Z5WVc5VmJTd0FSbTVEM3Nnd3BaWVR0TDN4YXFy?=
	=?utf-8?B?OEgzY0Q2aGthUk5LMDBlelM4UlBHNytpOE9ya21NZFhicmFiZjdqRUxqSi9o?=
	=?utf-8?B?S0k5clg4QUhSZTg2STY5VmZUUVhFTXFNTHIyYytJMU1mZ05yc1M2VlBldXY5?=
	=?utf-8?B?ald3cHpqYy9id29UWkQvOGpmbDJMWXlSU2dyYWwvK0F0NENaQTlScnZtNnRq?=
	=?utf-8?B?REMybHNSUTQrYnZzRDVocjdjWGVUY0NVTlNKYXFJYTVXMHFlRGVjai9XV1B1?=
	=?utf-8?B?K3ppWTNpS2J4WlRNZWxDd2VRQTZKNDRBQmRlOWUwR25WNUorQ1BRSDZiNE5a?=
	=?utf-8?B?cVFaM2gyRE5iODE0djU5bVlVUEo1c3k1eHVES1VsdzJ1b0h0d3dlSlBUWmVB?=
	=?utf-8?B?M2lnbjh4UEJsRFhXQXJqdW5mbjA5YWsxQkhsNGlLNlQ4RTk2dXp6VjNQTC9K?=
	=?utf-8?B?Umo5OEo1cHpRWENKc2YrU0hOYzdibFZyQ0g3N1d2bFNPTkNVamZDUFl5K1VJ?=
	=?utf-8?B?MzluSGlxR0h1SkhBUEVCaDd3OWovajQxUWJFYXJidWtONTl2V1lLaTZUaFdn?=
	=?utf-8?B?QVpXU3lQSDZHc1BycEh3MmFUSGhXTllGeXJteTRtUEpocWhCYlVEK0grQmxs?=
	=?utf-8?B?ZmtMS3EyL3BtZEE2UG9FOTg2NzhqbTdtNHpyTW5zYmM4QjM5Ym1Gdjg4MUFE?=
	=?utf-8?B?cHBiY0grRkZaWXlDa0l1cFFGMmtzS0FRT3hQendVV3p4Y1Q2Z09XVExvcklG?=
	=?utf-8?B?VEZiajJjdkpEcUh2S3V4cW8wRFZMaU0zNkt3RGNna0tSQnNWNVpmZDZ4UjQ5?=
	=?utf-8?B?UHpiZk5Id2Q4cGV3WXo1NHVURWNidzIydUQ3Rm1kaUR0YkdPRnlKTUszK3Bs?=
	=?utf-8?B?YmlsQTI0YVB3Sy9kYjNKc3Erb2wzVEZ3RkFYTXRpQ2Z4ZjdNVXFORjU2R2NT?=
	=?utf-8?B?Mnhtc3duYjBxTHlpZ1ArYVQ0NWpBMnEydmYzSUZaSVNoUVBkQVZVbWMxOUhE?=
	=?utf-8?B?WDh1bTRyYThHSnozUGxLT0c1ZVFJTU9ZcHZ1QU5WWEx1SWJ2VzZIUDNPb1g2?=
	=?utf-8?B?cFRjK2V3Zk5jMFQrRXc4N3gzc3dFWkFXeThKMUJFZ1laenFWTWpiczRtNi9B?=
	=?utf-8?B?U3N4YlBmb09CTkcvRjUxTVRGSnJ3Yk5NaEhSRG9zZk5NMFh4VjVnY01qbGdu?=
	=?utf-8?B?MldrZUxrTWxGQjNTTmw3bnpJNFBDOEp5Y1NUQTJpOWFmd0dLZGJEWnBFWFl1?=
	=?utf-8?B?SG1WRWRoVDJQUXV6QmhUazFybCs2bERQa0NsTzZnK1BtOFdDUzRpc2cyMWVu?=
	=?utf-8?B?bGlPejg3SmxpMlJWQXluN3NBQmZSUCtWY1hHdlRGRllFT3ZBWklNOU12M2Jn?=
	=?utf-8?B?TnhlMDRlbG9Vb0FlZDlPSEpTYXltUzlnVmM1TGZ3K3U1WXNMOHlBMjlHcGx4?=
	=?utf-8?B?QzRETlRVWnpBQnprTnZ6V21GT1NXWnVuZFpieFk5ZVVDOFZiWVFaNFdJTlZv?=
	=?utf-8?Q?iCDaB4IKaPjMnFjoRwrMGDEO3HjW+GEP0SrMW/NArikj?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3621004d-42ef-40d2-624d-08d9dacf4f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 22:10:17.2320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zj5k0blmXFkwJkXgnsmSuImlrYYFcoQQK20MteejdX9QG8EDrKYlnMCCxPbP8Ay7cdDtxYWYd2jyIv9ntTJBfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2379
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20IMANPk030562
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
Subject: Re: [dm-devel] [PATCH 13/19] block: move blk_next_bio to bio.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <B517DE78369F2A41BFFA7CE0A7153DC7@namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/17/22 11:19 PM, Christoph Hellwig wrote:
> Keep blk_next_bio next to the core bio infrastructure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>


Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

