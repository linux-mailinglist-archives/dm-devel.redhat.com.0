Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E90494938
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jan 2022 09:16:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-VN46PQ_uM1yiC0fuiCwdLw-1; Thu, 20 Jan 2022 03:16:56 -0500
X-MC-Unique: VN46PQ_uM1yiC0fuiCwdLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E0C41853024;
	Thu, 20 Jan 2022 08:16:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE4AC70D3F;
	Thu, 20 Jan 2022 08:16:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A44A41809CB8;
	Thu, 20 Jan 2022 08:16:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IMCWgK030689 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 17:12:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 32125C15E73; Tue, 18 Jan 2022 22:12:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D910C159F6
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 22:12:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CDDF3C0D1B1
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 22:12:32 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-467--ZHdUfcBNGq0P8zyOqb-NA-1; Tue, 18 Jan 2022 17:12:27 -0500
X-MC-Unique: -ZHdUfcBNGq0P8zyOqb-NA-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by BN8PR12MB3137.namprd12.prod.outlook.com (2603:10b6:408:48::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7;
	Tue, 18 Jan 2022 22:12:25 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f]) by
	MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f%6]) with mapi id 15.20.4909.007;
	Tue, 18 Jan 2022 22:12:25 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 15/19] block: pass a block_device and opf to
	bio_alloc_bioset
Thread-Index: AQHYDDwKaEQTLVOZi0Cg/CObFHXAKqxpWHgA
Date: Tue, 18 Jan 2022 22:12:25 +0000
Message-ID: <c4d0db2c-b487-e965-30da-507b30f29a6e@nvidia.com>
References: <20220118071952.1243143-1-hch@lst.de>
	<20220118071952.1243143-16-hch@lst.de>
In-Reply-To: <20220118071952.1243143-16-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 402ac08f-9cce-4f55-b50e-08d9dacf9b80
x-ms-traffictypediagnostic: BN8PR12MB3137:EE_
x-microsoft-antispam-prvs: <BN8PR12MB31375ABE3B2CA93FC2F5BFF8A3589@BN8PR12MB3137.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: P35+9WhpGmOgRscDuEjiAXZtjgzZyeaINJltJOo3NmdDyvm/8qz0gfIYUXbwFPBAXxHjzKko9dVUuZupQ7cq7kSd+rRY2GbBx43hhAprkPLMxJy7gJY940XJpQb+o1JQwK/s05WwbQsdbeF96cnOTUHc9QUFuQa4u7Fl7yX543g6+LK2bT+3AknsTHCVFnnscgUO1IAHXHZxUVjXzrgZPs8gZdzgbIGDoi/n9sxeaFY5J1dGPiSmgXKQe5wzEW1af+lw3OmZcX1/C48rgbrxLwNE+8R0yYyjCjC3hUgiQcBZzl9izH2YyKZ9W4Zt/+QAbNi3XSxzG2MXhI+VuQ/rBjDEqbZV3WceHFlTqGxSmMgn8ABxIBiTHO0HQ5FTXkL+uA22Kevmd6mu+fbLQHd7abrSpMidRp/K9M3Llal3T8rU7J7LjzLr3C6zjRYIqO97lM8tD6/45fJQv4tT26kKUxQ9QIkJBJV8R9oQpOE41MzMSBg35aHfEe0u1ECmCGII4MkRU+v2fKCRrZmRiyo7quaMyWex8Oz3u9MBnLx3a/ErB/GYqbfSRKvn1WVnk1e+YrvY18NM5Z+mEPqEYoqgpJW5qc9neuJeUp/mXw0ONV2gunz5DKK+3haidH4TBrHi/D7i08BFVrc/lJr7kh7x3z1rLomTyRlAfe80RT2ZzgkMld/kAxlTTKQm9xwMUzXGqsI+LcKvBGTxtjaFFJRZlFSn19ms2mzFT6MT4yoqjuCVSUcdKuqSa+C4ccjyiBaiJye6LLwMnQaPHFgp9ITvPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(36756003)(4326008)(66946007)(6486002)(38100700002)(76116006)(6506007)(7416002)(2906002)(53546011)(66446008)(64756008)(38070700005)(4744005)(83380400001)(71200400001)(122000001)(5660300002)(186003)(66476007)(91956017)(6512007)(508600001)(86362001)(31686004)(31696002)(54906003)(66556008)(2616005)(8676002)(110136005)(8936002)(316002)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NW1yYlRJbmJhK2hEZVVJOSt4VEIvTkt3ZWs2RWpwQ0MyZFBaQnMwaTNqM0Vp?=
	=?utf-8?B?TzltK1Rxb3FNMEZ0Z1BuaG9zUm9HQVJhSlN5VVdwLys5TnVIR1dCL3czY29n?=
	=?utf-8?B?aW9KWW5rT0NiNGhtME1PZCtXLzdjL2xTS1ZtbmRrYTVOS3F6UGJPQlVCbXVS?=
	=?utf-8?B?ZDZJWXM1TWtqQWFSMHIxTmdBM0NUWUF4WHdQaG1TajE2VTNKNStnLzhKc0th?=
	=?utf-8?B?K3llTENXdGQ5QXM1WVg4aUM3am5MWHZTSUtPbjdkemZObndkYjV4Ky9XYWkx?=
	=?utf-8?B?bWhMMkQvZXlDVGk0TTRxQUFvZnh1WHp3TXNVUjIwbWduUTZtRmNMTFJhUlYr?=
	=?utf-8?B?VHMzL05qUktMRlZ0bEcrOE5aTzdULzJqYWoyTURjOVF1ZldrazliSVBPN0JT?=
	=?utf-8?B?eWtVcGRjeDZDV2ZJT1NqOUdRMURDRjRFL1hDd0ljY1JIVStwaUc1ZXJjM1N4?=
	=?utf-8?B?Um5jZkZkRHZMTWo2emhWTVVXcXlaVDlmMnIzeUNXRTREZlZCLzNucEZ5MmFx?=
	=?utf-8?B?ek5SYkFSYU1jbXQwa3JMMmNEYUNEcjdjWjZNVmZiNVpKcERvZ2RFdC9Lc2oz?=
	=?utf-8?B?Nnk4MHdSUzFxN1pTbzRZM2s5ZmFzdUUxWThFWmppd1Nxd29yQTNVQjAySXQ4?=
	=?utf-8?B?Y0IyRUR1SmkzdW1heUo2M1Ewc0FxaUkwQkV6ZUV5VVo4TkFLbWF5a05MM1FN?=
	=?utf-8?B?STZBNUw3N1BZb3VlMTdZRkRjNGtxb2ExblV2MENxbE42dW5wM2JBdnFwVzFD?=
	=?utf-8?B?c2hCckVQeWd3cjBva3VvTElUUDljd2ZGTU50VmFxUUwzcWdXaFFEUjgreVRO?=
	=?utf-8?B?ZjNyY1doTS8zWnNUeEFscjEvSHZUZUt6VmwwdWhhY0E2SHJ0c2QxQml2K0ZX?=
	=?utf-8?B?UE9xczBhT3F4cG1CdTdMMitveEQ0a3RPZDFEUUNELzhCL2N5cTlmQ2lqcENw?=
	=?utf-8?B?b1kyL3NTeEZuNTU0azEvUm1HK05MRmF6eXdyU0lNV0ZBRWRHbWtYTlJiL3VJ?=
	=?utf-8?B?aEFNTklKeTlRWDJGR2F2V2twU3YySnBsMzQwamE0M3M2Tkt6SEZuRWM0dWE5?=
	=?utf-8?B?RFduNERRKzNwSDhQSW5VQ3lRQ2pNS0E3ckMzM1lGbTFvK0pwaGcwNlhzZW5u?=
	=?utf-8?B?UWtXWTFVQkN5cWN1NmhGNzQzanp5VEREMDFNRm14K1RpUElINU9yZFZDMURJ?=
	=?utf-8?B?TERaUUFnOVRnY24wU05TRjRkd3d2VmtCVkNLbE5CRmREY3p5dlRqTGVaNm1v?=
	=?utf-8?B?VWdUOXAySHZDUEhtanBkSVByZXd3Sm9YaDZVQ3ZUaERRYUd5R0Izem96TmE1?=
	=?utf-8?B?MzRoM0grc1RTMStpZlA0ZC82UXVoRDFLTE1yYmVkNUJhTFdaYWI3VENwQXpE?=
	=?utf-8?B?T3I5c1ZpL0FobWo0RHZlZ0R3OWtHamN3YmJaN3h5UW1DbDdqZ25OTHRKRC82?=
	=?utf-8?B?dnArVGh2cCs1bnlUZ2JTR0JyeWI3SmNaQzk1MmprMFVjb1lsUlhMQzBIYVZW?=
	=?utf-8?B?dFNybC84Mjl1aFRBc0FQdEV1S3ZUQjhSaUc0enRaejhxTFBKVE9oeDNqbUlG?=
	=?utf-8?B?N21weHBlRHNDeG1pc2tTczdWS092RzR2OUNRM3RTMEZmRjdTdU9ycndNY1Zn?=
	=?utf-8?B?aE9hdDY5YXFaUW80N2dpTXdGT05XdEw4dHVVeUV0UnVjai9OZFVtV3dpNFk0?=
	=?utf-8?B?WE51clVhcm5JR2ttVEJUT1kxWnFMMklzMFl4QS9yaHVjYzY5K3FwQlJUR0FU?=
	=?utf-8?B?SXdOaDFuK3k2dmpiR1VEdG1mOVVncVo2MUtiNnJEVFA1U3dYczIrSmxYV25r?=
	=?utf-8?B?b2xYbW9xeGl2djJBQW5vV01SdWd1RkRtaHBaMUp4am9yWUJHRm5pdGVKS21y?=
	=?utf-8?B?c3FmMGVVWjZ6dncybGFpV0FWc1VOUFBhejhnejhtS2szb3llZ29hZ0poVTBl?=
	=?utf-8?B?K3FmbGp2TUc3cUpBdlR0bnhVWXczK2hmM245L1dQZ1NNem0xQlV3dFB1R3Ru?=
	=?utf-8?B?WWJJdkkreVoyQW0yNlgrMW10NXdjcEZZcVRMcThWZnh5ZEYxWDFVSTJhM3RC?=
	=?utf-8?B?WUZISmt5b3hwK0tJaXQ5Q2h2MWhpUkxDeThXcnprWTRCdVVBL3lGaGVVd2dq?=
	=?utf-8?B?RGRSMUhZc3U4YWc4NnFVcHR4Rmk2RWZsMW5SWkJIZkV1eEhJd1Y2TW92eU5T?=
	=?utf-8?Q?GzMzaljxOGpsCDb6F1z9WUGXGqC9AqrRcbuFf0wR+ZkJ?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402ac08f-9cce-4f55-b50e-08d9dacf9b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 22:12:25.0999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzO8dghXgOa2yP3PXOxNcApzIWQklEaL++I44FdcYTVju3yQ15cJa9x3zbVzJjKWKtZU0ribL4KiyYEDdcT9PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3137
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20IMCWgK030689
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
Subject: Re: [dm-devel] [PATCH 15/19] block: pass a block_device and opf to
 bio_alloc_bioset
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <E00E6E42D2517540A652FBBB17F3A16F@namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/17/22 11:19 PM, Christoph Hellwig wrote:
> Pass the block_device and operation that we plan to use this bio for to
> bio_alloc_bioset to optimize the assigment.  NULL/0 can be passed, both
> for the passthrough case on a raw request_queue and to temporarily avoid
> refactoring some nasty code.
> 
> Also move the gfp_mask argument after the nr_vecs argument for a much
> more logical calling convention matching what most of the kernel does.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>


Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

