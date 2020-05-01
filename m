Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 904EE1C0B32
	for <lists+dm-devel@lfdr.de>; Fri,  1 May 2020 02:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588292182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Dwdql7M6vxEc7Hed0Nz70X4AEQx5FdbPVXf25tEFUfY=;
	b=Ndd4byAbDOh/JgUxjJGnTQKDr0No2yjxSZBPZWejnyehqsb/t3vDr4Cj/4/iJIXCe0/LP8
	bRhdc33/Iz+AYFCTENMhF7oNj5cGxF552Uo16/TePzF/E6nW7YJRGtz5GX2BfuM3G1B0pq
	wT56GkDepDj+APx9hvo10RB9SjqgyMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-RzCvwSTKMZOcIZwglwbjEg-1; Thu, 30 Apr 2020 20:16:20 -0400
X-MC-Unique: RzCvwSTKMZOcIZwglwbjEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0C37835B8B;
	Fri,  1 May 2020 00:16:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0471660E1C;
	Fri,  1 May 2020 00:16:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F1FC1809542;
	Fri,  1 May 2020 00:16:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0410FMYO015426 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Apr 2020 20:15:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 166E810547DD; Fri,  1 May 2020 00:15:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1171B10BBCE4
	for <dm-devel@redhat.com>; Fri,  1 May 2020 00:15:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DAC580CDAF
	for <dm-devel@redhat.com>; Fri,  1 May 2020 00:15:19 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-zwWgc3lrNA-rdoI0UMxK5g-1; Thu, 30 Apr 2020 20:15:16 -0400
X-MC-Unique: zwWgc3lrNA-rdoI0UMxK5g-1
IronPort-SDR: 652XaLxud4p58n57iwL2/CStmbK1dWgTIL6tjnrvJ7OoLOCbdO2Ef/P5FXG8Pulrq41/k5f3lv
	hUmwmEf4KW8fG+45vUTymeqg/Z7ON+4GG1Q89MlLHQpyfTGZQYN87cvGRBdhKKAGYrxLtzsfyc
	NwEXNW6DPKCvPMWpGUZkSt8aYiEi4fM7bpU2qLQ3HDmuPJ3YryEZdZraS88yPUYc8nclIzOymz
	aDEY8Je/8qtm6ZN10o1UPgqPSRbcGYYpoB8JRt6fDKBAx3lFoPsf8G2iPz/f5swMXCz9cq1gFm
	hk8=
X-IronPort-AV: E=Sophos;i="5.73,337,1583164800"; d="scan'208";a="245428163"
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
	by ob1.hgst.iphmx.com with ESMTP; 01 May 2020 08:15:14 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6628.namprd04.prod.outlook.com (2603:10b6:a03:228::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20;
	Fri, 1 May 2020 00:15:13 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%8]) with mapi id 15.20.2937.026;
	Fri, 1 May 2020 00:15:13 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 13/13] dm-zoned: metadata version 2
Thread-Index: AQHWFvu5g0vjXXC3Y0qnRS2giZbn9w==
Date: Fri, 1 May 2020 00:15:13 +0000
Message-ID: <BY5PR04MB69007AC959AB1FB32B63453AE7AB0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200420100824.124618-1-hare@suse.de>
	<20200420100824.124618-14-hare@suse.de>
	<BY5PR04MB6900EA4ACB7303A1D5889C0EE7AC0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<00d8048c-4f2e-82ef-7296-978ffa05bf62@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a379656b-9609-4cf7-bf60-08d7ed64b82b
x-ms-traffictypediagnostic: BY5PR04MB6628:
x-microsoft-antispam-prvs: <BY5PR04MB6628D870D9253332A01E4E63E7AB0@BY5PR04MB6628.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0390DB4BDA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mOKPoWD/R+Nqa9ii2lwiwKWwvM6bi/2BFqsGuzrMO4fcdR4wZIDCgE2QKfEt4z0E+Te4Q0qZBBEKDuJQfG8zM8RJpWvpyPM1O2V/i3pfcoL+HSJ5hccPSO33RY0cnNo29yphMcrn4dlSSPaiGlZpYnhBo2bhmU2silcwl0o9ZJGpDTUlD+H9Zpq7qUr/6Rcj/O4YnHwGpGy4JeeMWuYe+Se6LzQGVOwkAIFcMEC6QarQSy15QdylajOWK607NU8L0US2YlSnGl1pW15KG4rRzENTuKsBD2/tQBQwxq218SQgpJAaFJGu/2Q0hox1AQNg31XfqcOrwl+CrpXjynvblSONWTSfi/LZGefILvz7rx7C19aWPCwyTuhkN2REmhpV5m9Tp2rwxanKsUql8Es37nhKcrAIz14RznExXFB5dI+CcV4BFu5l7aEFhWQ1/6e4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(9686003)(54906003)(66556008)(186003)(110136005)(8936002)(7696005)(76116006)(66476007)(66446008)(66946007)(64756008)(71200400001)(316002)(52536014)(55016002)(478600001)(86362001)(33656002)(2906002)(8676002)(6506007)(4744005)(5660300002)(26005)(4326008)(53546011);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: D5IcccMaMYp0O3Jv5Lg2Fq6jTHEG+ZBvOy7Qpvw1zepk6nsK7QS9S3/NKhPzbaPVgcTV4sOk+6strtgWwQrYoSJDglDKrA7XfuBqurb2CqPBS+/F8R6EP5rXO2HONodbC1QPrpRQFcfX4NoZMSCJ6mK0SpOXNpWF0knRErJ9VRGrShd+oRdsUMypeGvC8ySBoCUXU+wZUNfHprLmTO2LAAWRCPcDTj/8w2EDO5HJFkMmArdT8wY+ABjy0C6BhDOfi3OsVvhHePMN2gp5HaB9FIGCk68dLT5HI9KIi8bWUbnpIrDSQgUzKklZCDS4KRnLSaWK9Ru2XapscNm7Shibb4eCJIsJryoaBE5MZc51z8x7q1UTfgoVw7Mot0k6GPLDPq+fJsNoSjuTiOViOCx6wmnEuskEKL6Z1Afto+lPUVWZybXts6cTq9TkLu+f3G2hOMBIvgGZ6OWxjUSroj2CndffXkXT7JxL1Q9tQ+cCgJ/uDNJ+KXGAOH9vfE//A4CtgO0zA0N3Vuoe6sgzaoQYZv35eq6+taO33dxMnxwE76F3VVZyexMzY/MHpnxcQ6djw+8XpbsP7j0gpsTF4BeFNoBGXgP743MW4WnvNQkJb/KiPB5JQv7HAQQ8UwyADCc3tRAJvhZrCsMijn42zUjvzrcApeXkj218U1Uwpwux0mzOfvfpQ8UMkpdDN2Eou3y8wIHg+/il0P0JjwoHWNkc45mfUynzyjlJgmDygEkgUcI+106+jjw8D2jQvSoewAIHKFaW2aSa8yZn9drWSXwYMa9uEZduvVfuFz4rqwE9nqk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a379656b-9609-4cf7-bf60-08d7ed64b82b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2020 00:15:13.7347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHn7IxTQYQwsWNzbiEEwtheOWiD13LlxkBkHa99inqjgMp+W4kZ9zyUuoCbI+O2byj5SwFM+lVS4SW1+kqhn+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6628
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0410FMYO015426
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 13/13] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/30 23:45, Hannes Reinecke wrote:
>>> +unsigned int dmz_dev_zone_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>>> +{
>>> +	unsigned int zone_id;
>>> +
>>> +	if (WARN_ON(!zone))
>>> +		return 0;
>>> +
>>> +	zone_id = zone->id;
>>> +	if (zmd->nr_devs > 1 &&
>>> +	    (zone_id >= zmd->dev[1].zone_offset))
>>> +		zone_id -= zmd->dev[1].zone_offset;
>>
>> We could have this as:
>>
>> 	if (zone_id >= zmd->dev[0].nr_zones)
>> 		zone_id -= zmd->dev[0].nr_zones;
>>
>> No ? It is simpler and we can kill the zone_offset.
>>
> Yes, but it will make the device arrangement implicit; by specifying
> the block offset we allow us the option of possibly moving the block 
> offset into the metadata, and then having the metadata specifying the
> layout.
> Something which I'd like to keep as I have this weird idea of using 
> other, non-standard, drives, too, which then would require a more 
> complex layout.

OK. Got it. Let's keep this as is then.


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

