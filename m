Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DF6EF202DE9
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 02:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592785719;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Z569OafT7ZDwBzOPAlZ3HgaIzVtuPR+fQwSXsPibH+w=;
	b=HeWYJVvjICmlbkp/aieraImhS3bPH31Z1h1Yhxb2iUK2OjsJsq2h7s3zLNUwu8nxHxd3rk
	XClntjo9zebsIvHDsoijUBRE0z0Nuf39iwW6xw0TXpFgkaLMYOryCAtpoMEsvM1yZTuLMt
	HXoxd/8lNvI5l6wXARcGPVE/4W5jOxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-HxqJGCcfMaut6g8VWHgG7Q-1; Sun, 21 Jun 2020 20:28:36 -0400
X-MC-Unique: HxqJGCcfMaut6g8VWHgG7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CE788018AB;
	Mon, 22 Jun 2020 00:28:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D3C5BAD4;
	Mon, 22 Jun 2020 00:28:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6124D1809547;
	Mon, 22 Jun 2020 00:28:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05M0Rj0h019137 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 21 Jun 2020 20:27:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9AA162157F25; Mon, 22 Jun 2020 00:27:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9504F2157F23
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:27:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 362AB858F03
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:27:43 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-249-A5tM7eu9O3SQm8-CoYFzFQ-1; Sun, 21 Jun 2020 20:27:38 -0400
X-MC-Unique: A5tM7eu9O3SQm8-CoYFzFQ-1
IronPort-SDR: QFQbcL856eiXFW46ZHZ7EOoqxvAwJrrs35mx0BuamqDvwClBe7bjjpDI7fg79l92q1HvNGTBYA
	1jf2Vpg/HFTr1D9pvVSmoFHt/mn8SS29BlIoXM+XYbIWBqoStScyd4YkfDIR4ZIIKrDd5ULy+1
	V8pZVA1HA+s8TDe66rKmWMSW/mZg8ee8GJAD2MOtQIQUDtHUZ8WyucEAesTKrxMaxUVwrrpLkO
	DqzjTj1XgkMR1MnWhO0Lto9Y3j/vhT3+MFIX2dC2GTbKnAxiVVo+GvIL/JBqTn1AEyslY2gHNc
	Egg=
X-IronPort-AV: E=Sophos;i="5.75,264,1589212800"; d="scan'208";a="144883644"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2020 08:27:37 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0376.namprd04.prod.outlook.com (2603:10b6:903:be::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23;
	Mon, 22 Jun 2020 00:27:34 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Mon, 22 Jun 2020 00:27:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [RFC PATCH 2/2] dm: don't try to split REQ_OP_ZONE_APPEND bios
Thread-Index: AQHWRgczjPsIYl+9xUe/paWaQEGH6A==
Date: Mon, 22 Jun 2020 00:27:34 +0000
Message-ID: <CY4PR04MB37514F8CCE7918A7C13FCA82E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
	<20200619065905.22228-3-johannes.thumshirn@wdc.com>
	<CY4PR04MB37514CDC42E7F545244D66C6E7980@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200619162658.GB24642@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ddce9943-bdbe-4c26-9db7-08d816430f3c
x-ms-traffictypediagnostic: CY4PR04MB0376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB0376685C8E0A499409F847B5E7970@CY4PR04MB0376.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ullllfG5DxpL3besiRSAgP7aeekmn3uXxB6A4KReZt9/9v0Grc1lmGh/5J30xhX6CV50m/J5UBzW7sMFM8Pi5ZjJWDIuiyd4Y7dYF0VIuyh3JFtTBheKU+2I66BL4EfrtbXQd8gxTRjx3cAhXLthwSbLHI9m1keiZyx9xEkpnv0UOKzByed5ugieL9YiEMJp2PU/GwA4ZfHcXqfa1f/SHpCFagPhOaoLHK6dWSnNxt1CMsri28Ku9Su5cECA5suEb//DRjKsvKXZGlsvqEPxj4L9gaisndMKtEy3DzeRNJcWU52kVVIOwwICqKHHE2uc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(136003)(39850400004)(366004)(396003)(86362001)(6916009)(8936002)(52536014)(5660300002)(8676002)(64756008)(66446008)(66476007)(91956017)(66556008)(33656002)(76116006)(83380400001)(71200400001)(66946007)(4326008)(26005)(53546011)(6506007)(9686003)(55016002)(2906002)(186003)(478600001)(316002)(7696005)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: LGcBToxxP3D8JB3AOwYBq1HlGYscqUUdg0Q+4AtlX11xaH42cVwqdhHf9RDs1Hu8vPmEU5Wm5w3L+/riqeyEzxXgrja1//yUmnusORohs/v+h4uZ4BgvkYhib9hp0SVJCGWMyKFlFKE7SvHYUOU29deTykwkAhsqqmvzvYisULT0Evt6x6lvZgu/ls2ngAJ9W+EO3XMg4DVsSfW6JYvMak4OTrj/JfHlP6+fRiwSxCot6j82F6+AYhadxlFZYckkgL4+46Bwr+uoJYWNfBUDijXCFwpDJhCUy2NEuGWVnOJzocDxWsMfhHaRCxRe65CXN0dtrVufONW3VHMTpoWx+S7p6G4U7BMnNn3QvcLL7obicaG3bvshBvutcMS1YrA5P32XbbrZbmL4rzER25x9lq6emGE8FRhFCFQthmtdWb6GQYTYHM2decr0KJQVSVx8owU9YCztROGKI40jwRmiVArPqBQYs7GvtSuuEsR4O5wZrSOVvU+tclFz1+ldFQ36
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddce9943-bdbe-4c26-9db7-08d816430f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 00:27:34.5886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1ga1qwKST8gr+uT+KoJYBHkWQDKepOCIgYvuuCShsefinXIkkui2ddSvLCg7S22gSKn5vg40MK1CTki5kbnOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0376
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05M0Rj0h019137
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Naohiro Aota <Naohiro.Aota@wdc.com>
Subject: Re: [dm-devel] [RFC PATCH 2/2] dm: don't try to split
	REQ_OP_ZONE_APPEND bios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/20 1:27, Mike Snitzer wrote:
> On Fri, Jun 19 2020 at  3:54am -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> On 2020/06/19 15:59, Johannes Thumshirn wrote:
>>> REQ_OP_ZONE_APPEND bios cannot be split so return EIO if we can't fit it
>>> into one IO.
>>>
>>> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>>> ---
>>>  drivers/md/dm.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
>>> index 058c34abe9d1..c720a7e3269a 100644
>>> --- a/drivers/md/dm.c
>>> +++ b/drivers/md/dm.c
>>> @@ -1609,6 +1609,9 @@ static int __split_and_process_non_flush(struct clone_info *ci)
>>>  
>>>  	len = min_t(sector_t, max_io_len(ci->sector, ti), ci->sector_count);
>>>  
>>> +	if (bio_op(ci->bio) == REQ_OP_ZONE_APPEND && len < ci->sector_count)
>>> +		return -EIO;
>>> +
>>>  	r = __clone_and_map_data_bio(ci, ti, ci->sector, &len);
>>>  	if (r < 0)
>>>  		return r;
>>>
>>
>> I think this is OK. The stacked max_zone_append_sectors limit should have
>> prevented that to happen  in the first place I think, but better safe than sorry.
>>
>> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> If stacked max_zone_append_sectors limit should prevent it then I'd
> rather not sprinkle more zoned specific checks in DM core.

Mike,

Just to be extra sure, I checked this again. Since for zoned block devices the
mapping of a target must be zoned aligned and a zone append command is always
fully contained within a zone, we do not need this check. The stacked limits and
submit_bio() code will fail a zone append command that is too large or that
spans zones before we get here.

That is of course assuming that the target does not expose zones that are mapped
using multiple chunks from different devices. There is currently no target doing
that, so this is OK. We can safely drop this patch.

Thanks.

> 
> Thanks,
> Mike
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

