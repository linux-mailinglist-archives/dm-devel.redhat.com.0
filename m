Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D1AC01E1DA4
	for <lists+dm-devel@lfdr.de>; Tue, 26 May 2020 10:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590482963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LRr7Neda0Uxm0rK2LfBlIlS7Ow7/tD1EgQkh7S6HzIM=;
	b=G960c1yo9OlFFWavJzqLwdukF0qzu/pb8P0lmHkdPcYB8tcI+FAuJMXSVj/VQ/5MVvcgVf
	y9d4UXbNc5pjgAIvyJT+WjGjBEPWTmbpTVLrtRRm90y3OK9WzEdsPdsQ2sYTwn5Pg9gKjU
	VxzrQdLIBHXSHgoOhdbTNkv1nK3ynLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-eICbhotcOKeiQfReq-BzXw-1; Tue, 26 May 2020 04:49:21 -0400
X-MC-Unique: eICbhotcOKeiQfReq-BzXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C40C835B69;
	Tue, 26 May 2020 08:49:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 689AA5C1BB;
	Tue, 26 May 2020 08:49:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D306A1809543;
	Tue, 26 May 2020 08:49:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04Q8mvUt020275 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 04:48:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8348B20267F2; Tue, 26 May 2020 08:48:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD3B2026971
	for <dm-devel@redhat.com>; Tue, 26 May 2020 08:48:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AEEC1859163
	for <dm-devel@redhat.com>; Tue, 26 May 2020 08:48:55 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-269-Aa4xVH1eNvCnGNOuFuyGVQ-1; Tue, 26 May 2020 04:48:50 -0400
X-MC-Unique: Aa4xVH1eNvCnGNOuFuyGVQ-1
IronPort-SDR: y88+RzPenAAtgJC17kSq5q11KkJt2tbXUFOnr2g1GPXTUiQNvXh3bHnZZO1mpFS8DSe63cWgxc
	M+lDkKE699nsSScbm/XGDEo3R4mLImVKz10XsNO/Cmdj9kJvR32pyBsH68+zTVUvkiZ+yxOipF
	0kUwZJ5HVlOpMKbDoVkKojYC7euSMPNqKbu75qd36nCk/euZDMu5lQ667gr8llFmXxa55wxdnO
	kyPHVhECevYWcpOTdBQ6meAmbrjDmFS/ePa4tkpAcHQDZoRTiKxw4H6QACRNKwoIRU8jB3csez
	onQ=
X-IronPort-AV: E=Sophos;i="5.73,436,1583164800"; d="scan'208";a="138832795"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
	by ob1.hgst.iphmx.com with ESMTP; 26 May 2020 16:48:49 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0553.namprd04.prod.outlook.com (2603:10b6:903:b5::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Tue, 26 May 2020 08:48:47 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Tue, 26 May 2020 08:48:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 03/12] dm-zoned: use on-stack superblock for tertiary
	devices
Thread-Index: AQHWME8lphdKG8LpwUepS4VewGDG4w==
Date: Tue, 26 May 2020 08:48:47 +0000
Message-ID: <CY4PR04MB3751038F62CCE4431153C4DFE7B00@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-4-hare@suse.de>
	<CY4PR04MB3751FB76DF953D2E84BFC419E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
	<66f5340e-b069-8c1a-3c61-5f4bb9f469af@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 905c43a0-34f4-4ed8-28ef-08d801519ad1
x-ms-traffictypediagnostic: CY4PR04MB0553:
x-microsoft-antispam-prvs: <CY4PR04MB05535460192B6032CB9F8F98E7B00@CY4PR04MB0553.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kaON9E+eIqN8pXx+c60NqNPJolTG0W0xjlo5uHqt6NPyRwRB5VMJyDTaNJSmn0bNF9kXjOB+Zih49slihTEbBr+hYmmTLQb/+SYoNXfL/BOihm4a80MMTsW9dW85OxObCVPzxVkXW3cIm/AmvmqGXPc8YYpSiD24s/6Q1RWrhFlycYrG4UIv3r9teSzyaXglaRQKuXx8pRvfFfuSMiwcgBjTamW7a4GVoTrvnkUZtW9+RKhyUScsP9DQ/M98v6uJcfu+KiKlwmug5b//X4HjxEQPklQGJOs4ES3hApg+pwZNHJvQ0aZjHVrher9mHt0CEkDwAWDIwxhwYSq5Gljykw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(33656002)(52536014)(91956017)(5660300002)(66446008)(76116006)(64756008)(66556008)(66946007)(186003)(66476007)(26005)(8676002)(8936002)(316002)(4326008)(54906003)(2906002)(7696005)(71200400001)(53546011)(9686003)(6916009)(6506007)(478600001)(86362001)(55016002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: OsNKlXsMIEuAHLrqlUBeoAPKA7rmG+a9+TOjVpzG/3VUPvf1Su13o9UpPab7+03WF3uGOU80J9FPQ5GB7Lx24T4NKH1gcl706Ibl5KrHtvMuwTLu3XhjCvCoozW9Nq9DoCnehr0Q4v1U2tsw5K7pWbOb3hhHetfLmDMyMjRYxNV49lk/YETCNhMdjr9RVl4ORgMbVvTnOLElQi+mrm2PermszV6xkeWw6/RmwENKptCsZNTHtRHQN+I8GufIPqXW+1neqHkt3kiPQTLVJqr/G4Nnz5jXabh93MjKu/917vHVo4ODliztULQooS9y3M+Ml5iSSrXLnTkcTEvXpDVCogrgWaTPZX+Pken3DcB+EzE2zDNPEc3GjMS6b4lZhN3gelsMjtJxpfwfdFTHbf05LLt+F/DNYBH9PBVv3qCUq2GSNVM+XR79rYMgNVuy6MiATuU2leOKqKQb+gHq9JwD2rPmiEWKp6VCVBxADqvzYdWgdj9WeGdn+cvKdLDd2Nn4
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905c43a0-34f4-4ed8-28ef-08d801519ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 08:48:47.3782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mYhIKoZfhqC4xPlpTMYM5YMk62Aw8AUgauSummz8WTeZsWnGr/A9CqEY+GxtqN3j0mjdZ+VtQRgtX24NvtK1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0553
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04Q8mvUt020275
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 03/12] dm-zoned: use on-stack superblock for
 tertiary devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/26 17:25, Hannes Reinecke wrote:
> On 5/25/20 4:09 AM, Damien Le Moal wrote:
>> On 2020/05/23 0:39, Hannes Reinecke wrote:
>>> Checking the teriary superblock just consists of validating UUIDs,
>>
>> s/teriary/tertiary
>>
>>> crcs, and the generation number; it doesn't have contents which
>>> would be required during the actual operation.
>>> So we should use an on-stack superblock and avoid having to store
>>> it together with the 'real' superblocks.
>>
>> ...a temoprary in-memory superblock allocation...
>>
>> The entire structure should not be on stack... see below.
>>
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/md/dm-zoned-metadata.c | 98 +++++++++++++++++++++++-------------------
>>>   1 file changed, 53 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>>> index 3da6702bb1ae..b70a988fa771 100644
>>> --- a/drivers/md/dm-zoned-metadata.c
>>> +++ b/drivers/md/dm-zoned-metadata.c
> [ .. ]
>>> @@ -1326,18 +1327,32 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>>>   		      "Using super block %u (gen %llu)",
>>>   		      zmd->mblk_primary, zmd->sb_gen);
>>>   
>>> -	if ((zmd->sb_version > 1) && zmd->sb[2].zone) {
>>> -		zmd->sb[2].block = dmz_start_block(zmd, zmd->sb[2].zone);
>>> -		zmd->sb[2].dev = dmz_zone_to_dev(zmd, zmd->sb[2].zone);
>>> -		ret = dmz_get_sb(zmd, 2);
>>> -		if (ret) {
>>> -			dmz_dev_err(zmd->sb[2].dev,
>>> -				    "Read tertiary super block failed");
>>> -			return ret;
>>> +	if (zmd->sb_version > 1) {
>>> +		int i;
>>> +
>>> +		for (i = 1; i < zmd->nr_devs; i++) {
>>> +			struct dmz_sb sb;
>>
>> I would rather have dmz_get_sb() allocate this struct than have it on stack...
>> It is not big, but still. To be symetric, we can add dmz_put_sb() for freeing it.
>>
> While I do agree to not having it on the stack, having dmz_get_sb() 
> returning the structure would require (yet another) overhaul of the
> main metadata structure which currently has the primary and secondary
> superblocks embedded.
> And I would argue to keep it that way, as the primary and secondary 
> superblocks are essential to the actual operation. So allocating them 
> separately would mean yet another indirection to get to them.
> At the same time, any tertiary superblock is just used for validation
> during startup, and not referenced anywhere afterwards.
> So using kzalloc() here and freeing them after checking is fine.

OK. Works for me.

> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

