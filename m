Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D90E268238
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 02:56:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-rIRY1Ok-OhK6N7wv6j8x1Q-1; Sun, 13 Sep 2020 20:56:09 -0400
X-MC-Unique: rIRY1Ok-OhK6N7wv6j8x1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 109951005E62;
	Mon, 14 Sep 2020 00:56:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E651002D46;
	Mon, 14 Sep 2020 00:56:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C5B98C7B5;
	Mon, 14 Sep 2020 00:55:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08E0tqLw017676 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 13 Sep 2020 20:55:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B1E61111429; Mon, 14 Sep 2020 00:55:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 245C7111142B
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 00:55:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72AD811E81
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 00:55:49 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-238-_irZMhDoPZqHSuzNKb1INA-1; Sun, 13 Sep 2020 20:55:47 -0400
X-MC-Unique: _irZMhDoPZqHSuzNKb1INA-1
IronPort-SDR: gHgUHrOih9ysw4rUHJBftDPQM99A447ZwLbgbkEvtjLqkMO4E4RfoBnShPwZNiM2kVmQAszJF4
	8Qw/Mq2mpJ7LtVXVJ6yd/rpi6c5rFg2JVs5rn36rjiEp5UwsOcnhmWT8e65TA4WCfhsppcAgtb
	nND3JZChbYaVRFs4XHapqaDD32/HGJHka4sUmj1cBtm/dTl5ndZPiWProPHOoHCTfGguS7Hu7/
	wb3fSCRdYWeki2SAFd5404f/WEFqvV9a/UuRH41AZ0XdF4DabX4L2X8xejUyzdSBjIdzar9EY3
	O+U=
X-IronPort-AV: E=Sophos;i="5.76,424,1592841600"; d="scan'208";a="151625261"
Received: from mail-sn1nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.57])
	by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2020 08:55:47 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR0401MB3586.namprd04.prod.outlook.com (2603:10b6:910:8e::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.18;
	Mon, 14 Sep 2020 00:55:43 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019;
	Mon, 14 Sep 2020 00:55:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>
Thread-Topic: [PATCH 3/3] block: allow 'chunk_sectors' to be non-power-of-2
Thread-Index: AQHWiIYOYez7hWogSk6+KVMC1NA11A==
Date: Mon, 14 Sep 2020 00:55:43 +0000
Message-ID: <CY4PR04MB37516E15A40D808D4810D26BE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-4-snitzer@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1adcd303-0a66-45ad-d147-08d85848e8ad
x-ms-traffictypediagnostic: CY4PR0401MB3586:
x-microsoft-antispam-prvs: <CY4PR0401MB35867E66ADD97A3B72A1F780E7230@CY4PR0401MB3586.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aEdaVv9YYUL753J9E/znrpTjRZHSyZW8o8kZVQEy4leqa/glfgZA+ypXL5BovEsPu9nNWaelpfMQBK76ozRafosNKUIDMJakGTXY9c26ORUapQ0aiU6cfnBZa3KW2+/y5TJW+Ynqn2PXLtVc/b5cP7lUfCI0S1QHvra+9+oEBvY9KaTjL5OBnKBhflrNGQw4KSKWGF61ZArilvdnbjWopPpQLQbT+zj9WpIodN06Uwl2NzQPKSV5YUSxfT0R+ffoqt69QNnQyMBbx0Mkc7E5I++lPTky+OK+qC4iNfHqioUxUxOQ+pxHHwT6CAIe8sUA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(76116006)(91956017)(66476007)(66556008)(66446008)(33656002)(2906002)(5660300002)(52536014)(186003)(66946007)(316002)(71200400001)(64756008)(53546011)(6506007)(478600001)(7696005)(8676002)(83380400001)(54906003)(110136005)(9686003)(86362001)(55016002)(8936002)(4326008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: FbJaqGf9Sxgsa99rJ6rkImC184ueOCMBY8L3z21VDjhhXABQvJu+ahSPOiubL00LCTwi6TCHMWsr+Gw/1lkjQHcZ6fi3gyHqPVjNhjzDG/psyi1e8fQ83fkqyqu6I3XLHjzHyBVcp1zBS0I+eYaVe8PIPpkcbXEZC9L9JM1GkvWKOneTiz/wwRXeOwmpebI4kTsyatIqPv6aAp/C1V2/xOxxZwX+V52nKC7H/riE+Z8KgigEyXdJ6h77JnwBTr/01b1IOGhOEnRC/LYpaRoROIGk+aJzznF2J3Ix2haVr9YtRyGMA8TzEq4a9fRgNgtnOTuoDpM6OmUGcFgddAVrl8sFZ46gedkrdbwhHuXCtnH7ewkj1IhK4wz3+xFIQzlZ+O9zJIjTIP7fjdZY6kua0dvTkJ2ORnduHsDlHoR9MmuXS1CpuuIcnWHIYbUmvrQN+IVJWXd2QCqDDwIrtzQDw9QZjYF01GVTwZAtMaFkHaQXHLQyIrT50XYrCG5tsK/3CaNUh3z0XOz3czSwHlUO/DbeWaLT59f2vGxOjUKFrEyDAb2gxqsCVFYuYKHmwuXWXu1TjHCZAsJFNt4DDEY+NSmY1JdMwnY4yUpPt8aXFFf+Iz65MfDJsFOhBaZIUANxbDyzhfWYIJdzverybSEXMkkjOo/SofabA0ge2nUHCH8+IyRsE1cgyLynmKSAOFCt5ll3tlsampTyjNYy/TEb6w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adcd303-0a66-45ad-d147-08d85848e8ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 00:55:43.6570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zdc1M9/W+R+Nd0EFM2j5Cu5LHsnA+hIyjfc9ZkFT7O3MeYVq91DbGq1BU3HA4APbjAeoXmAO0ahElaIUBswGFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3586
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08E0tqLw017676
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] [PATCH 3/3] block: allow 'chunk_sectors' to be
	non-power-of-2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2020/09/12 6:53, Mike Snitzer wrote:
> It is possible for a block device to use a non power-of-2 for chunk
> size which results in a full-stripe size that is also a non
> power-of-2.
> 
> Update blk_queue_chunk_sectors() and blk_max_size_offset() to
> accommodate drivers that need a non power-of-2 chunk_sectors.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  block/blk-settings.c   | 10 ++++------
>  include/linux/blkdev.h | 12 +++++++++---
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index b09642d5f15e..e40a162cc946 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -172,15 +172,13 @@ EXPORT_SYMBOL(blk_queue_max_hw_sectors);
>   *
>   * Description:
>   *    If a driver doesn't want IOs to cross a given chunk size, it can set
> - *    this limit and prevent merging across chunks. Note that the chunk size
> - *    must currently be a power-of-2 in sectors. Also note that the block
> - *    layer must accept a page worth of data at any offset. So if the
> - *    crossing of chunks is a hard limitation in the driver, it must still be
> - *    prepared to split single page bios.
> + *    this limit and prevent merging across chunks. Note that the block layer
> + *    must accept a page worth of data at any offset. So if the crossing of
> + *    chunks is a hard limitation in the driver, it must still be prepared
> + *    to split single page bios.
>   **/
>  void blk_queue_chunk_sectors(struct request_queue *q, unsigned int chunk_sectors)
>  {
> -	BUG_ON(!is_power_of_2(chunk_sectors));
>  	q->limits.chunk_sectors = chunk_sectors;
>  }
>  EXPORT_SYMBOL(blk_queue_chunk_sectors);
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 453a3d735d66..e72bcce22143 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1059,11 +1059,17 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
>  static inline unsigned int blk_max_size_offset(struct request_queue *q,
>  					       sector_t offset)
>  {
> -	if (!q->limits.chunk_sectors)
> +	unsigned int chunk_sectors = q->limits.chunk_sectors;
> +
> +	if (!chunk_sectors)
>  		return q->limits.max_sectors;
>  
> -	return min(q->limits.max_sectors, (unsigned int)(q->limits.chunk_sectors -
> -			(offset & (q->limits.chunk_sectors - 1))));
> +	if (is_power_of_2(chunk_sectors))
> +		chunk_sectors -= (offset & (chunk_sectors - 1));

I do not think you need the outer parenthesis here.

> +	else
> +		chunk_sectors -= sector_div(offset, chunk_sectors);
> +
> +	return min(q->limits.max_sectors, chunk_sectors);
>  }
>  
>  static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
> 

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

