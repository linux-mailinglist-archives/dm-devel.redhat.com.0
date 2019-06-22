Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9B4F306
	for <lists+dm-devel@lfdr.de>; Sat, 22 Jun 2019 03:14:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED77C3082B43;
	Sat, 22 Jun 2019 01:14:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E64E5D969;
	Sat, 22 Jun 2019 01:14:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E32681806B19;
	Sat, 22 Jun 2019 01:13:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5M1DPQx022504 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 21:13:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A56401001E65; Sat, 22 Jun 2019 01:13:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E5AF1001E61;
	Sat, 22 Jun 2019 01:13:21 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A083AC058CA8;
	Sat, 22 Jun 2019 01:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561165999; x=1592701999;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=NLHnRUAICa0FhahH+V46y5+LcvaLpnih2HyNGbeR1qs=;
	b=mZLah1rkB8/RPex0JwAdShBbKWNKQBainqJnbA1sJQcCal0OK5matsem
	DUGUHrmZsIpnCAkE3fJKVM/gV29oNIpHSkfxHKJ0SgfZZK/JnZXri7xSZ
	t/CGX/Sho+jW49vB6dqS/z4H69R7Q3uyAMoQkhVphqftFK+cJmofN9Cq5
	fiPcYIHqjrr68eSn8Cp1+Gq5iewyHv7lN6SDalk4qtfAWSZvRUPVv0e0Z
	2Z6fyqv43AML7hhNxrchA7Q81uek+kkwF8ugUIyQgYila9kFqz+Kps8Ls
	bNZpNS8Hz+6I47SVDDRNKplwiIbX/2YFacAnZfFGSyO8smGUXrpBg2XQt g==;
X-IronPort-AV: E=Sophos;i="5.63,402,1557158400"; d="scan'208";a="112835979"
Received: from mail-by2nam01lp2058.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.58])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2019 09:12:45 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qe6jjccL4+LyXSrabG25wFwU63+PIZScOJFrCFU+kMc=;
	b=B9d4mcvmLfqUtIPXSWkh5Vqi3YPsjJgBPka5oVIYb9K/mXl6ltKzIjJPfmIoJ34o469EfucfVphF6MWhILMi951BsL+5IFkh86VJ699LmxhVB9v+e5+8yfKqFeMdKka6CzSQwsZGd/kkjEX/NOtxpZspBabBShIptx/+upHEFt8=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4135.namprd04.prod.outlook.com (20.176.250.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Sat, 22 Jun 2019 01:12:43 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6%7]) with mapi id 15.20.1987.014;
	Sat, 22 Jun 2019 01:12:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@lightnvm.io>, "axboe@fb.com"
	<axboe@fb.com>, "hch@lst.de" <hch@lst.de>, Chaitanya Kulkarni
	<Chaitanya.Kulkarni@wdc.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 3/4] scsi: sd_zbc: add zone open, close, and finish
	support
Thread-Index: AQHVKDJQ1kFjoU4TbESp3h1U0NgG7w==
Date: Sat, 22 Jun 2019 01:12:43 +0000
Message-ID: <BYAPR04MB58164B645ED9BE7FA861BE33E7E60@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-4-mb@lightnvm.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cff6e2c-0d9f-49a9-3f5c-08d6f6aebae4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4135; 
x-ms-traffictypediagnostic: BYAPR04MB4135:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB41355E36EF64FB5340AB51A4E7E60@BYAPR04MB4135.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(136003)(366004)(346002)(376002)(199004)(189003)(14454004)(81166006)(14444005)(26005)(256004)(3846002)(25786009)(6116002)(53936002)(71200400001)(446003)(71190400001)(476003)(486006)(66946007)(55016002)(186003)(66574012)(7696005)(74316002)(6506007)(81156014)(8676002)(5660300002)(9686003)(64756008)(66476007)(66446008)(53546011)(66556008)(102836004)(99286004)(76116006)(73956011)(229853002)(91956017)(8936002)(305945005)(76176011)(7736002)(52536014)(6436002)(4326008)(33656002)(66066001)(6246003)(72206003)(2201001)(2501003)(86362001)(478600001)(2906002)(110136005)(316002)(7416002)(68736007)(54906003)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4135;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j38CHE9hygDH9tfDmk9uAStDzmSF6H0w8zidOSOAeCuOzV2iIFfrjBii6/KWxUrORBu1dgaObz8+wuyeoY+OEJ9wDGgkiqri9pdiYqdkmA6pAdRVURQ6z+Zuj7aK3IIk716yzw+oSNtgt47GAdEh0qFrmAb4FsUBrvhYy2YMWqsinxSRcdhKSYEZXSyVhiKSfi8J2AsK2PQkCJxh+gGCsRI3I4YUuxkVUuq4/Wi1uZXgxxqjcLTCOR/kCB73iVFohDysRD/M12Luro/X08UzoF0RO7dK2pCgmQLMQ08ZVZaDzDHIi2nd7+6qOZ3+QIqhLJchm575ble9PjhC05cqJlXV8XiFi1FUq5/Esc0iXRzdOWCIt50S3FrDx9ViIWeqb8KOLFmmt7B3vc1bH8SizFSeCLaMHh6rc2sWpOk8bOU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cff6e2c-0d9f-49a9-3f5c-08d6f6aebae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 01:12:43.8707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4135
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Sat, 22 Jun 2019 01:13:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Sat, 22 Jun 2019 01:13:18 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,
	SPF_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=069675b12=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5M1DPQx022504
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 3/4] scsi: sd_zbc: add zone open, close,
 and finish support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 22 Jun 2019 01:14:05 +0000 (UTC)

On 2019/06/21 22:07, Matias Bj=F8rling wrote:
> From: Ajay Joshi <ajay.joshi@wdc.com>
> =

> Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
> support to allow explicit control of zone states.
> =

> Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
> ---
>  drivers/scsi/sd.c     | 15 ++++++++++++++-
>  drivers/scsi/sd.h     |  6 ++++--
>  drivers/scsi/sd_zbc.c | 18 +++++++++++++-----
>  3 files changed, 31 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index a3406bd62391..89f955a01d44 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -1292,7 +1292,17 @@ static blk_status_t sd_init_command(struct scsi_cm=
nd *cmd)
>  	case REQ_OP_WRITE:
>  		return sd_setup_read_write_cmnd(cmd);
>  	case REQ_OP_ZONE_RESET:
> -		return sd_zbc_setup_reset_cmnd(cmd);
> +		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
> +					ZO_RESET_WRITE_POINTER);
> +	case REQ_OP_ZONE_OPEN:
> +		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
> +					ZO_OPEN_ZONE);
> +	case REQ_OP_ZONE_CLOSE:
> +		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
> +					ZO_CLOSE_ZONE);
> +	case REQ_OP_ZONE_FINISH:
> +		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
> +					ZO_FINISH_ZONE);
>  	default:
>  		WARN_ON_ONCE(1);
>  		return BLK_STS_NOTSUPP;
> @@ -1958,6 +1968,9 @@ static int sd_done(struct scsi_cmnd *SCpnt)
>  	case REQ_OP_WRITE_ZEROES:
>  	case REQ_OP_WRITE_SAME:
>  	case REQ_OP_ZONE_RESET:
> +	case REQ_OP_ZONE_OPEN:
> +	case REQ_OP_ZONE_CLOSE:
> +	case REQ_OP_ZONE_FINISH:
>  		if (!result) {
>  			good_bytes =3D blk_rq_bytes(req);
>  			scsi_set_resid(SCpnt, 0);
> diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
> index 5796ace76225..9a20633caefa 100644
> --- a/drivers/scsi/sd.h
> +++ b/drivers/scsi/sd.h
> @@ -209,7 +209,8 @@ static inline int sd_is_zoned(struct scsi_disk *sdkp)
>  =

>  extern int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buff=
er);
>  extern void sd_zbc_print_zones(struct scsi_disk *sdkp);
> -extern blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd);
> +extern blk_status_t sd_zbc_setup_zone_mgmt_op_cmnd(struct scsi_cmnd *cmd,
> +						   unsigned char op);

In ZBC specs, open, close, finish and reset command are all ZBC_OUT (94h)
commands with a different servie action. So may be renaming this function to
sd_zbc_setup_zbc_out_cmnd() is better.

>  extern void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_byt=
es,
>  			    struct scsi_sense_hdr *sshdr);
>  extern int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
> @@ -226,7 +227,8 @@ static inline int sd_zbc_read_zones(struct scsi_disk =
*sdkp,
>  =

>  static inline void sd_zbc_print_zones(struct scsi_disk *sdkp) {}
>  =

> -static inline blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd)
> +static inline blk_status_t sd_zbc_setup_zone_mgmt_op_cmnd(struct scsi_cm=
nd *cmd,
> +							  unsigned char op)
>  {
>  	return BLK_STS_TARGET;
>  }
> diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
> index 7334024b64f1..41020db5353a 100644
> --- a/drivers/scsi/sd_zbc.c
> +++ b/drivers/scsi/sd_zbc.c
> @@ -168,12 +168,17 @@ static inline sector_t sd_zbc_zone_sectors(struct s=
csi_disk *sdkp)
>  }
>  =

>  /**
> - * sd_zbc_setup_reset_cmnd - Prepare a RESET WRITE POINTER scsi command.
> - * @cmd: the command to setup
> + * sd_zbc_setup_zone_mgmt_op_cmnd - Prepare a zone ZBC_OUT command. The
> + *                                  operations can be RESET WRITE POINTE=
R,
> + *                                  OPEN, CLOSE or FINISH.
> + * @cmd: The command to setup
> + * @op: Operation to be performed
>   *
> - * Called from sd_init_command() for a REQ_OP_ZONE_RESET request.
> + * Called from sd_init_command() for REQ_OP_ZONE_RESET, REQ_OP_ZONE_OPEN,
> + * REQ_OP_ZONE_CLOSE or REQ_OP_ZONE_FINISH requests.
>   */
> -blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd)
> +blk_status_t sd_zbc_setup_zone_mgmt_op_cmnd(struct scsi_cmnd *cmd,
> +					    unsigned char op)
>  {
>  	struct request *rq =3D cmd->request;
>  	struct scsi_disk *sdkp =3D scsi_disk(rq->rq_disk);
> @@ -194,7 +199,7 @@ blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd=
 *cmd)
>  	cmd->cmd_len =3D 16;
>  	memset(cmd->cmnd, 0, cmd->cmd_len);
>  	cmd->cmnd[0] =3D ZBC_OUT;
> -	cmd->cmnd[1] =3D ZO_RESET_WRITE_POINTER;
> +	cmd->cmnd[1] =3D op;
>  	put_unaligned_be64(block, &cmd->cmnd[2]);
>  =

>  	rq->timeout =3D SD_TIMEOUT;
> @@ -222,6 +227,9 @@ void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned =
int good_bytes,
>  =

>  	switch (req_op(rq)) {
>  	case REQ_OP_ZONE_RESET:
> +	case REQ_OP_ZONE_OPEN:
> +	case REQ_OP_ZONE_CLOSE:
> +	case REQ_OP_ZONE_FINISH:
>  =

>  		if (result &&
>  		    sshdr->sense_key =3D=3D ILLEGAL_REQUEST &&

The comment after this code references only the reset operation. So it need=
s to
be updated. The same comment applies to all operations as they all have the=
 same
error return behavior.

-- =

Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
